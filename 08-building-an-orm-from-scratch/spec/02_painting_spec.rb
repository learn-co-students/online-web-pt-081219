# frozen_string_literal: true

require 'spec_helper'

describe 'Painting' do
  let(:leo) { Artist.new(name: 'Leonardo da Vinci') }
  let(:mona) { Painting.new(name: 'Mona Lisa', artist_id: leo.save.id) }

  before(:each) do
    DB[:conn].execute('DROP TABLE IF EXISTS artists')
    sql = <<~SQL
      CREATE TABLE IF NOT EXISTS artists (
        id INTEGER PRIMARY KEY,
        name TEXT
      )
    SQL

    DB[:conn].execute(sql)

    DB[:conn].execute('DROP TABLE IF EXISTS paintings')
    sql = <<~SQL
      CREATE TABLE IF NOT EXISTS paintings (
        id INTEGER PRIMARY KEY,
        name TEXT,
        artist_id INTEGER
      )
    SQL

    DB[:conn].execute(sql)
  end

  describe 'attributes' do
    it 'has a name and an artist_id' do
      painting = Painting.new(name: 'Mona Lisa', artist_id: 1)
      expect(painting.name).to eq('Mona Lisa')
      expect(painting.artist_id).to eq(1)
    end

    it 'has an id that defaults to `nil` on initialization' do
      expect(mona.id).to eq(nil)
    end
  end

  describe '.create_table' do
    it 'creates the painting table in the database' do
      DB[:conn].execute('DROP TABLE IF EXISTS paintings')
      Painting.create_table
      table_check_sql = <<~SQL
        SELECT tbl_name FROM sqlite_master WHERE type='table' AND tbl_name='paintings';
      SQL

      expect(DB[:conn].execute(table_check_sql)[0]).to eq(['paintings'])
    end
  end

  describe '#save' do
    it 'returns an instance of the Painting class' do
      painting = mona.save
      expect(painting).to be_instance_of(Painting)
    end

    it 'saves an instance of the Painting class to the database and then sets the given painting\'s `id attribute' do
      painting = mona.save
      expect(DB[:conn].execute('SELECT * FROM paintings WHERE id = 1')).to eq([[1, mona.name, leo.id]])
      expect(painting.id).to eq(1)
    end
  end

  describe '.find_by_id' do
    it 'returns a new painting object by id' do
      painting = mona.save
      painting_from_db = Painting.find_by_id(painting.id)
      expect(painting_from_db.id).to eq(painting.id)
      expect(painting_from_db.name).to eq(painting.name)
      expect(painting_from_db.artist_id).to eq(painting.artist_id)
    end
  end

  describe '#artist' do
    it 'returns an artist object with an id that matches #artist_id' do
      painting = mona.save
      artist = painting.artist

      expect(artist).to be_instance_of(Artist)
      expect(artist.id).to eq(painting.artist_id)
    end
  end
end
