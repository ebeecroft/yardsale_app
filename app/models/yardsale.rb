class Yardsale < ActiveRecord::Base
  attr_accessible :address_id, :begin_time, :date, :description, :end_time, :title
  has_one :address, dependent: :destroy
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 140 }
  validates :date, presence: true
  validates :begin_time, presence: true
  validates :end_time, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  default_scope order: 'yardsales.created_at DESC'

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", user_id: user.id)
  end

  def self.from_yardsales_yardsales_by(user)
    user_yardsale_ids = "SELECT user_id FROM yardsales WHERE user_id = :user_id"
    where("user_id IN (#{user_yardsale_ids}) OR user_id = :user_id", user_id: user.id)
  end
end