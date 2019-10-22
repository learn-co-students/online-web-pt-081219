# frozen_string_literal: true

require_relative '../config/environment'

DB[:conn] = SQLite3::Database.new ':memory:'

RSpec.configure do |config|
  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # you can do global before/after here like this:
  config.before(:each) do
    if Artist.respond_to?(:create_table)
      Artist.create_table
    else
      DB[:conn].execute('DROP TABLE IF EXISTS artists')
      DB[:conn].execute('CREATE TABLE IF NOT EXISTS artists (id INTEGER PRIMARY KEY, name TEXT)')
    end
  end

  config.after(:each) do
    DB[:conn].execute('DROP TABLE IF EXISTS artists')
  end
end
