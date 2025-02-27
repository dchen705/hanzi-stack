require 'bcrypt'

class Users
  include Database::Connection

  def create!(username, password)
    hashed_password = BCrypt::Password.create(password)
    query('INSERT INTO users (username, password) ' \
          'VALUES ($1, $2)', username, hashed_password)
  end

  def valid_credentials?(username, password)
    db_result = query('SELECT password FROM users WHERE username = $1', [username])
    if db_result.ntuples < 1
      false
    else
      hashed_password = db_result.values[0][0]
      BCrypt::Password.new(hashed_password) == password
    end
  end

  def add_deck!(username, deck_name)
    query('INSERT INTO decks (name, user_id) ' \
          'VALUES ($1, $2)', deck_name, user_id(username))
  end

  private

  def user_id(username)
    query('SELECT id FROM users WHERE username=$1', username).values[0][0]
  end
end
