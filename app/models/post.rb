class Post < ApplicationRecord
  belongs_to :user
  validates :chirp,
        length: {maximum: 170},
        presence: true,
        uniqueness: true

        validates :chirp,
                format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i


                  def self.timeline(user)
                    following_ids = user.followees(User).pluck(:id)
                    all_ids= following_ids << user.id
                    Post.where(user_id: all_ids).order("created_at DESC")
                  end

end
