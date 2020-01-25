class Pokemon
  
  attr_accessor :name, :type
  attr_reader :id, :db
  
  def initialize(id: nil, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type, db) VALUES (?, ?, ?)"
    db.execute(sql, name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  
  def update
    sql = "UPDATE pokemon SET name = ?, type = ?, db = ? WHERE id = ?"
    @db.execute(sql, self.name, self.type, self.db, self.id)
  end
  
end
