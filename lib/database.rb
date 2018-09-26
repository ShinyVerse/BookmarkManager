class Database

  def initialize
    @connection = PG.connect(dbname: ENV['DATABASE_NAME'])
  end

  def connect(database_name)
    PG.connect(dbname: database_name)
  end

  def select_all(table)
    @connection.exec("SELECT * FROM #{table};")
  end
end
