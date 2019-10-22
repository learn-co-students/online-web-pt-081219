# frozen_string_literal: true

require 'spec_helper'

describe 'Artist#paintings' do
  let(:leo) { Artist.new(name: 'Leonardo da Vinci') }
  let(:mona) { Painting.new(name: 'Mona Lisa', artist_id: leo.save.id) }
  let(:sup) { Painting.new(name: 'The Last Supper', artist_id: leo.save.id) }
  let(:salvator) { Painting.new(name: 'Salvator Mundi', artist_id: leo.save.id) }

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

  it 'returns an array of painting objects that belong to an aritist' do
    artist = leo.save
    painting_1 = mona.save
    painting_2 = sup.save
    painting_3 = salvator.save

    expect(artist.paintings.map(&:name)).to match_array([painting_1.name, painting_2.name, painting_3.name])
  end
end
