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
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
    db.execute(sql, name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  
  def self.find(id)
    poke = @db.execute("SELECT * FROM pokemon WHERE id = ?" id)
  end
  
end
