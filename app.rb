require 'bundler/setup'
require 'sinatra'

require_relative 'lib/helpers'
require_relative 'lib/database'
require_relative 'lib/characters'

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
  @characters = Characters.new(logger)
  session[:stack] ||= {}
  @stack = session[:stack]
end

get '/' do
  erb :home
end

get '/register' do
  erb :register
end

post '/register' do; end

get '/login' do
  erb :login
end

post '/login' do; end

post '/logout' do; end

get '/characters' do
  @characters_list = @characters.list
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

post '/deck/new' do; end

get '/deck/edit/:id' do
  id = params[:id]
  erb :deck_edit
end

post '/deck/edit/:id' do; end

post '/deck/remove' do; end

get 'flashcards/:id' do
  if params[:id] == 'stack'
    @flashcards = @stack
  end
  erb :flashcards
end