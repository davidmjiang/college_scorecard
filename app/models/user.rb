class User < ActiveRecord::Base

  has_secure_password

  validates :username,
            :presence => true

  validates :password, 
            :length => { :in => 8..24 }, 
            :allow_nil => true

  validates :email,
            :presence => true,
            :uniqueness => true


  has_many :reviews

  has_many :bookmarks
  has_many :schools, through: :bookmarks
  has_many :reviews, class_name: "Review", foreign_key: :user_id


end
