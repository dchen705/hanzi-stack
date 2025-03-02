require_relative 'database'

class Database
  class UserNotFoundError < StandardError; end

  # User-specific DB Interface
  class User
    include Database::Connection

    attr_reader :user_id

    def self.new(username, logger=nil)
      super
    rescue UserNotFoundError
      nil
    end

    def initialize(username, logger=nil)
      raise UserNotFoundError if username.nil?

      super(logger)
      @user_id = user_id(username)
      @username = username
    end

    def decks
      query('SELECT * FROM decks WHERE user_id=$1', @user_id).to_h do |tuple|
        [tuple['id'], tuple]
      end
    end

    def deck(id)
      result = query('SELECT * FROM decks WHERE id=$1 AND user_id=$2', id, @user_id)
      result.ntuples < 1 ? {} : result.first
    end

    def add_deck!(deck_name)
      query('INSERT INTO decks (name, user_id) ' \
            'VALUES ($1, $2)', deck_name, @user_id)
    end

    def remove_deck!(id)
      query('DELETE FROM decks WHERE id=$1', id)
    end

    def flashcards(deck_id)
      query('SELECT * FROM flashcards ' \
              'JOIN decks_flashcards ' \
              'ON flashcards.id = flashcard_id ' \
              'WHERE deck_id=$1', deck_id)
    end

    def to_s
      @username
    end

    private

    def user_id(username)
      query('SELECT id FROM users WHERE username=$1', username).values[0][0]
    rescue NoMethodError
      raise UserNotFoundError
    end
  end
end
