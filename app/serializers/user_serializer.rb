class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :avatar, :api_token, :name, :following

  def avatar
    Refile.attachment_url(object, :avatar, :fit, 800, 800, format: "jpg")
  end

  def following
    if current_user
      object.followed_by?(current_user)
    else
      false
    end
  end      
end
