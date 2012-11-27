class Comment < ActiveRecord::Base
  attr_accessible :comment

  validates :user_id,     :presence => true
  validates :yardsale_id, :presence => true
  validates :comment,     :presence => true

  belongs_to :user
  belongs_to :yardsale
end
