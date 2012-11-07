class Yardsale < ActiveRecord::Base
  attr_accessible :title, :description, :date, :begin_time, :end_time, :address_attributes

  belongs_to :user
  has_one    :address,    :dependent => :destroy
  accepts_nested_attributes_for :address
  has_many   :categories, :dependent => :destroy
  has_many   :pictures,   :dependent => :destroy
  has_many   :comments,   :dependent => :destroy

  validates :user_id,     :presence => true
  validates :title,       :presence => true, :length => { :maximum => 140 }
  validates :date,        :presence => true
                          #:format => { :with => /\d{2}\/\d{2}\/\d{4}/ }
  validates :begin_time,  :presence => true
                          #:format => { :with => /\d{2}\/\d{2}/ }
  validates :end_time,    :presence => true
                          #:format => { :with => /\d{2}\/\d{2}/ }
  validates :description, :presence => true, :length => { :minimum => 10 }

  default_scope order: 'yardsales.created_at DESC'

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT yardsale_id FROM relationships WHERE user_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", user_id: user.id)
  end

  def self.from_yardsales_yardsales_by(user)
    user_yardsale_ids = "SELECT user_id FROM yardsales WHERE user_id = :user_id"
    where("user_id IN (#{user_yardsale_ids}) OR user_id = :user_id", user_id: user.id)
  end
end