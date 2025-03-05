require_relative 'database'

class Database
  # General DB Interface
  class Interface
    include Database::Connection

    SEARCH_PAGE_LIMIT = 10

    # Users
    def add_user!(username, password)
      hashed_password = BCrypt::Password.create(password)
      query('INSERT INTO users (username, password) ' \
            'VALUES ($1, $2)', username, hashed_password)
    end

    def valid_credentials?(username, password)
      db_result = query('SELECT password FROM users WHERE username = $1', username)
      if db_result.ntuples < 1
        false
      else
        hashed_password = db_result.values[0][0]
        BCrypt::Password.new(hashed_password) == password
      end
    end

    # Characters
    def list_characters(page_number)
      offset = (page_number - 1) * SEARCH_PAGE_LIMIT
      query("SELECT * FROM characters OFFSET #{offset} LIMIT #{SEARCH_PAGE_LIMIT};").map do |tuple|
        { 'id' => tuple['id'],
          'hanzi' => tuple['hanzi'],
          'pinyin' => tuple['pinyin'],
          'meaning' => tuple['meaning'] }
      end
    end

    def detect_next_page(page_number)
      detect_page(page_number, SEARCH_PAGE_LIMIT)
    end

    def detect_previous_page(page_number)
      detect_page(page_number, -SEARCH_PAGE_LIMIT)
    end

    # Decks
    def add_deck!(username, deck_name)
      query('INSERT INTO decks (name, user_id) ' \
            'VALUES ($1, $2)', deck_name, user_id(username))
    end

    private

    def user_id(username)
      query('SELECT id FROM users WHERE username=$1', username).values[0][0]
    end

    def detect_page(page_number, offset_change)
      offset = ((page_number - 1) * SEARCH_PAGE_LIMIT) + offset_change
      return false if offset.negative?

      query("SELECT id FROM characters OFFSET #{offset} LIMIT #{SEARCH_PAGE_LIMIT}").ntuples >= 1
    end
  end
end
