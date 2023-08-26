class User < ApplicationRecord
  has_many :likes, dependent: :destroy

  validates :name, presence: true
end
