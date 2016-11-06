class PostSerializer < ActiveModel::Serializer
  attributes :id, :chirp, :created_at
  has_one :user
end
