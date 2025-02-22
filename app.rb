require 'bundler/setup'
require 'sinatra'

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
end

get '/' do
  erb :home
end

get '/characters' do
  @characters_list = @characters.list
  erb :characters
end
