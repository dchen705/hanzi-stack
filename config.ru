require 'bundler'

Bundler.require(:default, :development)

require File.expand_path('./app.rb', __dir__)
run Sinatra::Application
