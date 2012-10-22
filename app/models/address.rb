class Address < ActiveRecord::Base
  attr_accessible :city, :state, :street, :zip_code
end
