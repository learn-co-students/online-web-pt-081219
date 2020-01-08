class Verb < ApplicationRecord
  validates :infinitive, presence: true
end
