class PostSerializer < ActiveModel::Serializer
  attributes :id, :chirp
  has_one :user
end
