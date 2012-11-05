class Comment < ActiveRecord::Base
  attr_accessible :comment

  validates :yardsale_id, :presence => true
  validates :comment,     :presence => true

  belongs_to :yardsale
end
