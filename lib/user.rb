require_relative 'database'

class Database
  class UserNotFoundError < StandardError; end

  class User
    include Database::Connection

    def self.new(username, logger)
      super(username, logger)
    rescue UserNotFoundError
      return nil
    end

    def initialize(username, logger)
      raise UserNotFoundError if username.nil?

      super(logger)
      @user_id = user_id(username)
      @username = username
    end

    def decks; end

    def add_deck!(deck_name)
      query('INSERT INTO decks (name, user_id) ' \
            'VALUES ($1, $2)', deck_name, @user_id)
    end

    def flashcards; end

    private

    def user_id(username)
      query('SELECT id FROM users WHERE username=$1', username).values[0][0]
    rescue NoMethodError
      raise UserNotFoundError
    end
  end
end