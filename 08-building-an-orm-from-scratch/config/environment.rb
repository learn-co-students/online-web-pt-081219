# frozen_string_literal: true

require 'sqlite3'
require_relative '../lib/artist.rb'
require_relative '../lib/painting.rb'

DB = { conn: SQLite3::Database.new('db/development.db') }
