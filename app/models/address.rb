class Address < ActiveRecord::Base
  attr_accessible :city, :state, :street, :zip_code
  belongs_to :user
  belongs_to :yardsale

  validates :street,   presence: true
  validates :city,     presence: true
  validates :state,    presence: true
  validates :zip_code, presence: true

end
