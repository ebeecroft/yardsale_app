class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :address_attributes

  has_secure_password
  
  has_one  :address,   :dependent => :destroy
  accepts_nested_attributes_for :address
  has_many :yardsales, :dependent => :destroy
  has_many :comments,  :dependent => :destroy

  has_many :relationships, :foreign_key => "follower_id", :dependent => :destroy
  has_many :followed_yardsales, :through => :relationships, :source => :followed

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name,                  :presence => true, :length => { :maximum => 50 }
  validates :email,                 :presence => true,
                                    :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                                    :uniqueness => { :case_sensitive => false }
  validates :password,              :presence => true, :length => { :minimum => 6 }
  validates :password_confirmation, :presence => true

  def feed
    Yardsale.from_users_followed_by(self)
  end

  def post
    Yardsale.from_yardsales_yardsales_by(self)
  end

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
