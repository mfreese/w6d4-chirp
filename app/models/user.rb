class User < ApplicationRecord
  has_secure_token :api_token
  acts_as_follower
  acts_as_followable
  has_secure_password
  attachment :avatar
  has_many :posts




  validates :email,
            presence: true,
            uniqueness: true

  validates :name,
            presence: true,
            uniqueness: true





  validates :email,
          format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
end
