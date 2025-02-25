class Users
  include Database::Connection

  def create!(username, password)
    hashed_password = BCrypt::Password.create(password)
    query('INSERT INTO users (username, password)' \
          'VALUES ($1, $2)', username, hashed_password)
  end

  def valid_credentials?(username, password)
    hashed_password = query('SELECT password FROM users WHERE username = $1', [username]).values[0][0]
    BCrypt::Password.new(hashed_password) == password
  end
end