class User < ActiveRecord::Base
  has_many :groups, :dependent => :destroy
  has_many :links, :through => :groups
  has_many :colors, :dependent => :destroy
  has_secure_password

  validates :name, :password_digest, :presence => true

  before_save { self.email.downcase! }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :format => { :with => VALID_EMAIL_REGEX }, :uniqueness => { :case_sensitive => false }
end
