class Pokemon
  
  attr_accessor :name, :type
  attr_reader :id, :db
  
  def initialize(id: nil, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save
    p = self.new()
      sql = "INSERT INTO pokemon (name, type, db) VALUES (?, ?, ?)"
      DB[:conn].execute(sql, self.name, self.type, self.db)
      @id = @db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end
  end
  
  def update
    sql = "UPDATE pokemon SET name = ?, type = ?, db = ? WHERE id = ?"
    @db.execute(sql, self.name, self.type, self.db, self.id)
  end
  
end
