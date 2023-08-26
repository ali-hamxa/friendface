module Api
  module V1
    class PostSerializer < ActiveModel::Serializer
      attributes :id, :title, :body
      has_many :likes
    end
  end
end
