class Comment < ActiveRecord::Base
  attr_accessible :comment

  belongs_to :yardsale
end
