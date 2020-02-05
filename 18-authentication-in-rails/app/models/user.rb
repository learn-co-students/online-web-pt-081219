class User < ApplicationRecord
  def self.find_or_create_by_auth_hash(auth_hash)
    User.find_or_create_by(name: auth_hash['info']['name'])
  end
 end
