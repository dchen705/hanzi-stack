require_relative 'database'

class Database
  class UserNotFoundError < StandardError; end

  # User-specific DB Interface
  class User
    include Database::Connection

    attr_reader :user_id

    def self.new(username, logger = nil)
      super
    rescue UserNotFoundError
      nil
    end

    def initialize(username, logger = nil)
      raise UserNotFoundError if username.nil?

      super(logger)
      @user_id = get_user_id(username)
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

    def rename_deck!(id, new_name)
      query('UPDATE decks SET name=$1 WHERE id=$2', new_name, id)
    end

    def remove_deck!(id)
      query('DELETE FROM decks WHERE id=$1', id)
    end

    def update_memo!(deck_id, memo)
      query('UPDATE decks SET memo=$1 WHERE id=$2', memo, deck_id)
    end

    def flashcards(deck_id)
      query('SELECT * FROM flashcards ' \
            'JOIN decks_flashcards ' \
              'ON flashcards.id = flashcard_id ' \
            'JOIN characters ' \
              'ON characters.id = character_id ' \
            'WHERE deck_id=$1', deck_id)
    end

    def create_card!(character_id)
      result = query('SELECT id FROM flashcards WHERE user_id=$1 AND character_id=$2', @user_id, character_id)
      if result.ntuples < 1
        query('INSERT INTO flashcards (user_id, character_id) ' \
              'VALUES ($1, $2)', @user_id, character_id)
        result = query('SELECT id FROM flashcards WHERE user_id=$1 AND character_id=$2', @user_id, character_id)
      end
      result.values[0][0]
    end

    def add_card!(deck_id, flashcard_id)
      query('INSERT INTO decks_flashcards (deck_id, flashcard_id) ' \
            'VALUES ($1, $2)', deck_id, flashcard_id)
    rescue PG::UniqueViolation
      return
    end

    def remove_card!(deck_id, flashcard_id)
      query('DELETE FROM decks_flashcards WHERE deck_id=$1 AND flashcard_id=$2', deck_id, flashcard_id)
      result = query('SELECT id FROM decks_flashcards WHERE flashcard_id=$1', flashcard_id)
      query('DELETE FROM flashcards WHERE id=$1', flashcard_id) if result.ntuples < 1
    end

    def get_flashcard_id(character_id)
      result = query('SELECT id FROM flashcards WHERE user_id=$1 AND character_id=$2', @user_id, character_id)
      result.ntuples < 1 ? nil : result.values[0][0]
    end

    def to_s
      @username
    end

    private

    def get_user_id(username)
      query('SELECT id FROM users WHERE username=$1', username).values[0][0]
    rescue NoMethodError
      raise UserNotFoundError
    end
  end
end
