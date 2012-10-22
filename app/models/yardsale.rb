class Yardsale < ActiveRecord::Base
  attr_accessible :address_id, :begin_time, :date, :description, :end_time, :title
  belongs_to :user

  validates :user_id, presence: true
  validates :description, presence: true, length: { maximum: 140 }

  default_scope order: 'yardsales.created_at DESC'

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", user_id: user.id)
  end
end
