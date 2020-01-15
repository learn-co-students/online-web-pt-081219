# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

vergil = Author.find_or_create_by(name: 'Vergil')
ovid = Author.find_or_create_by(name: 'Ovid')

Book.find_or_create_by(title: "The Aeneid", author: vergil)
Book.find_or_create_by(title: "The Eclogues", author: vergil)
Book.find_or_create_by(title: "The Gorgics", author: vergil)

ovid.books.find_or_create_by(title: "The Amores")
ovid.books.find_or_create_by(title: "The Heroines")
ovid.books.find_or_create_by(title: "The Art of Love")
