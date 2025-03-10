# require 'simplecov'
# SimpleCov.start
ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require 'pry'

require_relative '../app'

# rubocop: disable Metrics/ClassLength
class RoutesTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def session
    last_request.env['rack.session']
  end

  def request_path
    last_request.env['PATH_INFO']
  end

  def admin_session
    { 'rack.session' => { username: 'admin' } }
  end

  def setup
    @test_data = Database::Interface.new
    @test_data.clear_tables
    @test_data.add_user!('admin', 'secret')
    @test_data.add_user!('alt', 'password')
    @test_user = Database::User.new('admin')
    @test_user.add_deck!('AdminsFirstDeck')
  end

  def teardown
    @test_data.clear_tables
    @test_data.reset_sequences
    @test_data.close_connection
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
    assert_includes last_response.body, 'test is already taken.'
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

  def test_view_decks
    # skip
    get '/decks'
    refute_includes last_response.body, 'AdminsFirstDeck'
    post '/login', { username: 'admin', password: 'secret' }
    get '/decks'
    assert_includes last_response.body, 'AdminsFirstDeck'
  end

  def test_add_deck
    # skip
    post '/deck/new', { 'deck-name' => 'AdminsSecondDeck' }, admin_session
    get '/decks', {}, admin_session
    assert_includes last_response.body, 'AdminsSecondDeck'
  end

  def test_protect_deck_route
    # skip
    post '/deck/new', { 'deck-name' => 'NoOwnersDeck' }
    assert_equal 302, last_response.status
    follow_redirect!
    assert_equal '/', request_path
    get '/decks'
    refute_includes last_response.body, 'NoOwnersDeck'
  end

  def test_deck_edit_link
    # skip
    get '/deck/edit', { 'deck-id' => '1' }, admin_session
    assert_includes last_response.body, 'AdminsFirstDeck'
  end

  def test_deck_not_found
    # skip
    get '/deck/edit', { 'deck-id' => '100' }, admin_session
    assert_equal 'Deck not found.', session[:message]
    assert_equal 302, last_response.status
  end

  def test_deck_edit_as_different_user
    # skip
    get 'deck/edit', { 'deck-id' => '1' }, { 'rack.session' => { username: 'alt' } }
    assert_equal 'Deck not found.', session[:message]
    assert_equal 302, last_response.status
  end

  def test_deck_rename
    # skip
    post '/deck/rename', { 'deck-id' => '1', 'new-name' => 'AdminsRenamedDeck'}, admin_session
    get '/decks', {}, admin_session
    assert_includes last_response.body, 'AdminsRenamedDeck'
  end

  def test_deck_remove_success
    # skip
    get '/decks', {}, admin_session
    assert_includes last_response.body, 'AdminsFirstDeck'
    post 'deck/remove', { 'deck-id' => '1', 'confirm' => 'true' }, admin_session
    assert_equal 'AdminsFirstDeck has been deleted.', session[:message]
  end

  def test_deck_remove_no_login
    # skip
    post 'deck/remove', { 'deck-id' => '1', 'confirm' => 'true' }
    refute_equal 'AdminsFirstDeck has been deleted.', session[:message]
  end

  def test_deck_remove_not_found
    # skip
    post 'deck/remove', { 'confirm' => 'true' }, admin_session
    assert_nil session[:message]
  end

  def test_add_card
    # skip
    post '/deck/edit/add', { 'deck-id' => '1', 'character-id' => '1' }, admin_session
    get '/deck/edit', { 'deck-id' => '1' }, admin_session
    assert_includes last_response.body, '一'
  end

  def test_remove_card
    # skip
    post '/deck/edit/add', { 'deck-id' => '1', 'character-id' => '1' }, admin_session
    post '/deck/edit/remove', { 'deck-id' => '1', 'character-id' => '1' }, admin_session
    get '/deck/edit', { 'deck-id' => '1' }, admin_session
    refute_includes last_response.body, '一'
  end

  def test_search_pagination_buttons_exists
    # skip
    next_page_button = %r{<button.* type="submit".*>Next Page</button>}
    prev_page_button = %r{<button.* type="submit".*>Previous Page</button>}
    get '/search/characters'
    refute_match prev_page_button, last_response.body
    assert_match next_page_button, last_response.body
    get '/search/characters', { 'page' => '2' }
    assert_match prev_page_button, last_response.body
    assert_match next_page_button, last_response.body
  end

  def test_search_char_page_one
    # skip
    get '/search/characters'
    assert_equal 200, last_response.status
    assert_includes last_response.body, 'yī'
  end

  def test_search_char_additional_pages
    # skip
    get '/search/characters', { 'page' => '2' }
    assert_includes last_response.body, 'zhuān'
    get '/search/characters', { 'page' => '3' }
    refute_includes last_response.body, 'zhuān'
    assert_includes last_response.body, 'diū'
  end

  # def test_characters_view_diff_user
  #   # get characters page logged in as alt user but params of deck of admin
  #   # refute page has deck info
  # end
end
