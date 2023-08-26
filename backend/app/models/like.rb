class Like < ApplicationRecord
  include LikeAnalytics

  belongs_to :likeable, polymorphic: true
  belongs_to :user

  validates :date, :user_id, :likeable_type, :likeable_id, presence: true
  validates :user_id, uniqueness: { scope: [:likeable_type, :likeable_id],
                                    message: "can only like a likeable once" }

end
