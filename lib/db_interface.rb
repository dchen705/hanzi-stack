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
    def list_characters(page_number, filters)
      offset = (page_number - 1) * SEARCH_PAGE_LIMIT
      sql = search_query(offset)
      sql_filters = normalize_filters(filters)
      result = query(sql, *sql_filters.values)
      parse_result(result)
    end

    def detect_next_page(page_number, filters)
      detect_page(page_number, SEARCH_PAGE_LIMIT, filters)
    end

    def detect_previous_page(page_number, filters)
      detect_page(page_number, -SEARCH_PAGE_LIMIT, filters)
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

    def detect_page(page_number, offset_change, filters)
      offset = ((page_number - 1) * SEARCH_PAGE_LIMIT) + offset_change
      return false if offset.negative?

      sql_filters = normalize_filters(filters)
      sql = search_query(offset)
      query(sql, *sql_filters.values).ntuples >= 1
    end

    def search_query(offset)
      <<~SQL
        SELECT * FROM characters
        WHERE hanzi LIKE $1
        AND pinyin LIKE $2
        AND meaning LIKE $3
        AND radical LIKE $4
        AND hsk2 LIKE $5
        AND hsk3 LIKE $6
        OFFSET #{offset} LIMIT #{SEARCH_PAGE_LIMIT};
      SQL
    end

    def normalize_filters(filters)
      sql_filters = filters.dup
      filters.each do |key, value|
        value = value.empty? ? '%' : value.strip
        value = "%#{value}%" if %w[meaning radical].include?(key)
        sql_filters[key] = value
      end
      sql_filters
    end

    # rubocop:disable Metrics/MethodLength
    def parse_result(result)
      result.map do |tuple|
        { 'id' => tuple['id'],
          'hanzi' => tuple['hanzi'],
          'pinyin' => tuple['pinyin'],
          'meaning' => tuple['meaning'],
          'frequency' => tuple['frequency'],
          'radical' => tuple['radical'],
          'gs_num' => tuple['gs_num'],
          'hsk2' => tuple['hsk2'],
          'hsk3' => tuple['hsk3'] }
      end
    end
    # rubocop:enable Metrics/MethodLength
  end
end
