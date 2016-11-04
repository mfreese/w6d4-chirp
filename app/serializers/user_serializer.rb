class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :avatar, :api_token, :name

  def avatar
    Refile.attachment_url(object, :avatar, :fit, 800, 800, format: "jpg")
  end
end
