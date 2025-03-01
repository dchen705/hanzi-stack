require 'pg'
require 'bcrypt'
require_relative 'helpers'

class Database
  NAME = ENV['RACK_ENV'] == 'test' ? 'hanzistack-test' : 'hanzistack'

  class << self
    def test_connect
      PG.connect(dbname: NAME) { |db| db }
    rescue PG::ConnectionBad
      create_database
      retry
    end

    private

    def create_database
      PG.connect(dbname: 'postgres') do |db_admin|
        db_admin.exec("CREATE DATABASE \"#{NAME}\";")
      end
      PG.connect(dbname: NAME) do |db|
        schema_sql = File.read(File.expand_path('../data/schema.sql', __dir__))
        db.exec(schema_sql)
      end
    end
  end

  module Connection
    def initialize(logger = nil)
      @db = if Sinatra::Base.production?
              PG.connect(ENV.fetch('DATABASE_URL'))
            else
              PG.connect(dbname: Database::NAME)
            end
      @logger = logger
    end

    def clear_tables
      @db.exec('DELETE FROM users;')
      @db.exec('DELETE FROM characters;')
      @db.exec('DELETE FROM decks;')
      @db.exec('DELETE FROM flashcards;')
      @db.exec('DELETE FROM decks_flashcards;')
    end

    def reset_sequences
      @db.exec('ALTER SEQUENCE users_id_seq RESTART WITH 1;')
      @db.exec('ALTER SEQUENCE characters_id_seq RESTART WITH 1;')
      @db.exec('ALTER SEQUENCE decks_id_seq RESTART WITH 1;')
      @db.exec('ALTER SEQUENCE flashcards_id_seq RESTART WITH 1;')
      @db.exec('ALTER SEQUENCE decks_flashcards_id_seq RESTART WITH 1;')
    end

    def close_connection
      @db.close
    end

    private

    def query(statement, *params)
      backtrace = caller_locations.first
      file = File.basename(backtrace.path)
      line = backtrace.lineno
      @logger&.info "file: #{file}.#{line} - #{statement}: #{params}"
      @db.exec_params(statement, params.flatten)
    end
  end
end
