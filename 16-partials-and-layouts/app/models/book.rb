class Book < ApplicationRecord
  belongs_to :genre
  belongs_to :author
  validates :title, presence: true, uniqueness: { scope: :author }

  def author_attributes=(args)
    self.author = Author.find_or_create_by(args)
  end

  def genre_attributes=(args)
    self.genre = Genre.find_or_create_by(args)
  end
end
