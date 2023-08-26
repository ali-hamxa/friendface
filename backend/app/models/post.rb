class Post < ApplicationRecord
  has_many :likes, as: :likeable
end
