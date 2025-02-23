class Characters
  include Database::Connection

  def list
    query('SELECT * FROM characters;').map do |tuple|
      { 'id' => tuple['id'],
        'hanzi' => tuple['hanzi'],
        'pinyin' => tuple['pinyin'],
        'meaning' => tuple['meaning'] }
    end
  end
end
