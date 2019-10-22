# frozen_string_literal: true

class Artist
  attr_accessor :name
  attr_reader :id

  def initialize(name:, id: nil)
    self.name = name
    @id = id
  end

  def update
    if id
      sql = <<~SQL
        UPDATE artists SET name = ? WHERE id = ?
      SQL

      DB[:conn].execute(sql, name, id)
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
        INSERT INTO artists (name) VALUES (?)
      SQL

      DB[:conn].execute(sql, name)
      @id = DB[:conn].execute('SELECT last_insert_rowid() FROM artists')[0][0]
    end

    self
  end

  def paintings
    sql = <<~SQL
      SELECT paintings.*
      FROM paintings INNER JOIN artists
      ON paintings.artist_id = artists.id
      AND artists.id = ?
    SQL

    rows = DB[:conn].execute(sql, id)

    rows.map do |row|
      Painting.new_from_db(row)
    end
  end

  def self.create_table
    sql = <<~SQL
      CREATE TABLE IF NOT EXISTS artists (
        id INTEGER PRIMARY KEY,
        name TEXT
      )
    SQL

    DB[:conn].execute(sql)
  end

  def self.new_from_db(row)
    new(name: row[1], id: row[0])
  end

  def self.find_by_id(id)
    sql = <<~SQL
      SELECT * FROM artists WHERE id = ? LIMIT 1
    SQL

    row = DB[:conn].execute(sql, id).first
    new_from_db(row)
  end
end
