require 'bundler/setup'
require 'sinatra'

require_relative 'lib/helpers'
require_relative 'lib/database'
require_relative 'lib/tables'
require_relative 'lib/user'

configure do
  enable :sessions
  set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
  set :erb, escape_html: true
end

configure(:development, :test) do
  require 'sinatra/reloader'
  also_reload 'lib/*.rb'
  Database.test_connect
end

before do
  @username = session[:username]
  @user = Database::User.new(@username, logger)
  @data = Database::Tables.new(logger)
  session[:stack] ||= {}
  @stack = session[:stack]
end

PROTECTED_ROUTES = ['/deck/*']

PROTECTED_ROUTES.each do |route|
  before route do
    unless signed_in?
      session[:message] = "Login required."
      redirect previous_url
    end
  end
end

get '/' do
  erb :home
end

get '/register' do
  erb :register
end

post '/register' do
  username = params[:username]
  password = params[:password]
  @data.add_user!(username, password)
  session[:username] = username
  redirect '/'
rescue PG::UniqueViolation
  session[:message] = "\"#{username}\" is already taken."
  status 422
  erb :register
end

get '/login' do
  redirect '/' if signed_in?
  session[:login_redirect] = previous_url unless from_bad_login_redirect?
  erb :login
end

post '/login' do
  username = params[:username]
  password = params[:password]
  if @data.valid_credentials?(username, password)
    session[:username] = username
    session[:message] = 'Welcome!'
    redirect session.delete(:login_redirect) || '/'
  else
    session[:message] = 'Invalid Credentials'
    status 401
    erb :login
  end
end

post '/logout' do
  logout
  redirect '/'
end

get '/characters' do
  @characters = @data.list_characters
  erb :characters
end

get '/stack' do
  erb :stack
end

post '/stack' do
  @stack[params[:id]] = true
end

post '/stack/remove' do
  @stack.delete(params[:id])
end

get '/decks' do
  erb :decks
end

post '/deck/new' do
  deck_name = params['deck-name']
  @user.add_deck!(deck_name)
  session[:message] = "#{deck_name} has been added to your decks."
  redirect '/decks'
end

get '/deck/edit/:id' do
  erb :deck_edit
end

post '/deck/edit/:id' do; end

post '/deck/remove' do; end

get 'flashcards/:id' do
  @flashcards = @stack if params[:id] == 'stack'
  erb :flashcards
end
