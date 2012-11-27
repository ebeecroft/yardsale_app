class Picture < ActiveRecord::Base
  attr_accessible :image, :note

  belongs_to :yardsale
end
