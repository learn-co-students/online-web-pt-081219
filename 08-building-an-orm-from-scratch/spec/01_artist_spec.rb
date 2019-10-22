# frozen_string_literal: true

require 'spec_helper'

describe 'Artist' do
  let(:leo) { Artist.new(name: 'Leonardo da Vinci') }

  before(:each) do
    DB[:conn].execute('DROP TABLE IF EXISTS artists')
    sql = <<~SQL
      CREATE TABLE IF NOT EXISTS artists (
        id INTEGER PRIMARY KEY,
        name TEXT
      )
    SQL

    DB[:conn].execute(sql)
  end

  describe 'attributes' do
    it 'has a name' do
      artist = Artist.new(name: 'Leonardo')
      expect(artist.name).to eq('Leonardo')
    end

    it 'has an id that defaults to `nil` on initialization' do
      expect(leo.id).to eq(nil)
    end
  end

  describe '.create_table' do
    it 'creates the artist table in the database' do
      DB[:conn].execute('DROP TABLE IF EXISTS artists')
      Artist.create_table
      table_check_sql = <<~SQL
        SELECT tbl_name FROM sqlite_master WHERE type='table' AND tbl_name='artists';
      SQL

      expect(DB[:conn].execute(table_check_sql)[0]).to eq(['artists'])
    end
  end

  describe '#save' do
    it 'returns an instance of the Artist class' do
      artist = leo.save
      expect(artist).to be_instance_of(Artist)
    end

    it 'saves an instance of the Artist class to the database and then sets the given artist\'s `id attribute' do
      artist = leo.save
      expect(DB[:conn].execute('SELECT * FROM artists WHERE id = 1')).to eq([[1, leo.name]])
      expect(artist.id).to eq(1)
    end
  end

  describe '.find_by_id' do
    it 'returns a new artist object by id' do
      artist = leo.save
      artist_from_db = Artist.find_by_id(artist.id)
      expect(artist_from_db.id).to eq(artist.id)
      expect(artist_from_db.name).to eq(artist.name)
    end
  end
end
