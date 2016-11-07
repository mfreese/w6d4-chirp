class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :avatar, :api_token, :name, :following, :followers_count, :followees_count

  has_many :posts

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

  def name
  user_name
  end

end
