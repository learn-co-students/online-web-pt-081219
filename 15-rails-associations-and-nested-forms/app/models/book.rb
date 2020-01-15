class Book < ApplicationRecord
  belongs_to :author

  def author_attributes=(attributes)
    self.author = Author.find_or_create_by(attributes)
  end
end
