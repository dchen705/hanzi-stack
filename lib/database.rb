require 'pg'

class Database
  NAME = Sinatra::Base.test? ? 'hanzistack-test' : 'hanzistack'

  class << self
    def connect
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
    def initialize(logger)
      @db = if Sinatra::Base.production?
              PG.connect(ENV.fetch('DATABASE_URL'))
            else
              PG.connect(dbname: Database::NAME)
            end
      @logger = logger
    end

    private

    def query(statement, *params)
      @logger.info "#{statement}: #{params}"
      @db.exec_params(statement, params.flatten)
    end
  end
end
