class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true
  has_many :pokemon

  def slug
    self.username.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    username = slug.split("-").join(" ")
    User.find_by_username(username)
  end
end
