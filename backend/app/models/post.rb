class Post < ApplicationRecord
  has_many :likes, as: :likeable

  validates :title, :body, presence: true
end
