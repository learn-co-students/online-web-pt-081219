# frozen_string_literal: true

class Painting
  attr_accessor :artist_id, :name
  attr_reader :id

  def initialize(id: nil, name:, artist_id:)
    self.artist_id = artist_id
    self.name = name
    @id = id
  end

  def update
    if id
      sql = <<~SQL
        UPDATE paintings SET name = ?, artist_id = ?WHERE id = ?
      SQL

      DB[:conn].execute(sql, name, artist_id, id)
    else
      save
    end

    self
  end

  def save
    if id
      update
    else
      sql = <<~SQL
        INSERT INTO paintings (name, artist_id) VALUES (?, ?)
      SQL

      DB[:conn].execute(sql, name, artist_id)
      @id = DB[:conn].execute('SELECT last_insert_rowid() FROM paintings')[0][0]
    end

    self
  end

  def artist
    Artist.find_by_id(artist_id)
  end

  def self.create_table
    sql = <<~SQL
      CREATE TABLE IF NOT EXISTS paintings (
        id INTEGER PRIMARY KEY,
        artist_id INTEGER,
        name TEXT
      )
    SQL

    DB[:conn].execute(sql)
  end

  def self.new_from_db(row)
    new(id: row[0], name: row[1], artist_id: row[2])
  end

  def self.find_by_id(id)
    sql = <<~SQL
      SELECT * FROM paintings WHERE id = ? LIMIT 1
    SQL

    row = DB[:conn].execute(sql, id).first

    new_from_db(row)
  end
end
