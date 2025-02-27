# require 'simplecov'
# SimpleCov.start
ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require 'pry'

require_relative '../app'

class RoutesTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def session
    last_request.env['rack.session']
  end

  def admin_session
    { 'rack.session' => { username: 'admin' } }
  end

  def setup
    @users = Users.new
    @users.clear_data
    @users.create!('admin', 'secret')
  end

  def teardown
    @users.clear_data
    @users.close_connection
  end

  def test_home_logged_out
    # skip
    get '/'
    assert_equal 200, last_response.status
    assert_equal 'text/html;charset=utf-8', last_response['Content-Type']
    assert_includes last_response.body, 'Login'
    assert_includes last_response.body, 'Register'
  end

  def test_home_logged_in
    # skip
    get '/', {}, admin_session
    assert_equal 200, last_response.status
    assert_equal 'text/html;charset=utf-8', last_response['Content-Type']
    refute_includes last_response.body, 'Login'
    assert_includes last_response.body, 'Log out'
    assert_includes last_response.body, 'admin'
  end

  def test_register_link
    # skip
    get '/register'
    register_form = %r{<form.* action="/register".* method="post".*>}
    assert_match register_form, last_response.body
  end

  def test_register_success
    # skip
    post '/register', { username: 'test', password: 'password' }
    assert_equal 302, last_response.status

    follow_redirect!
    assert_includes last_response.body, 'test'
  end

  def test_register_error_dup_username
    # skip
    post '/register', { username: 'test', password: 'password' }
    assert_equal 302, last_response.status

    post '/register', { username: 'test', password: 'secret' }
    assert_equal 422, last_response.status
    assert_includes last_response.body, 'Username is already taken.'
  end

  def test_register_fail
    # skip
  end

  def test_login_link
    # skip
    get '/login'
    login_form = %r{<form.* action="/login".* method="post".*>}
    assert_match login_form, last_response.body
  end

  def test_login_again_redirect
    # skip
    get '/login', {}, admin_session
    assert_equal 302, last_response.status
    follow_redirect!
    login_form = %r{<form.* action="/login".* method="post".*>}
    refute_match login_form, last_response.body
  end

  def test_login_success
    # skip
    post '/login', { username: 'admin', password: 'secret' }
    assert_equal 302, last_response.status
    follow_redirect!
    assert_includes last_response.body, 'admin'
  end

  def test_login_fail
    # skip
    post '/login', { username: 'test', password: 'password' }
    assert_equal 401, last_response.status
    assert_includes last_response.body, 'Invalid Credentials'
  end

  def test_logout
    # skip
    post '/login', { username: 'admin', password: 'secret' }
    post '/logout'
    assert_equal 302, last_response.status
    follow_redirect!
    refute_includes last_response.body, 'admin'
  end

  def test_get_characters_page
    skip
    get '/characters'
    assert_equal 200, last_response.status
    assert_includes last_response.body, 'yī'
  end
end
