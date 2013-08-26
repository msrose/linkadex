class User < ActiveRecord::Base
  has_many :groups, :dependent => :destroy
  has_many :links, :through => :groups
  has_many :colors, :dependent => :destroy
  before_create :create_remember_token, :create_verification_token

  validates :name, :presence => true

  before_save { self.email.downcase! }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :format => { :with => VALID_EMAIL_REGEX }, :uniqueness => { :case_sensitive => false }

  has_secure_password

  validates :password, :length => { :minimum => 6 }

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def verified?
    self.verification_token.nil?
  end

  def verify!
    self.update_attribute(:verification_token, nil)
  end

  def unverify!
    create_verification_token
    self.save
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

    def create_verification_token
      self.verification_token = SecureRandom.urlsafe_base64
    end
end
