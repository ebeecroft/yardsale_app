class Address < ActiveRecord::Base
  # un mass assign user_id and yardsale_id
  attr_accessible :street, :city, :state, :zip_code, :user_id, :yardsale_id

  belongs_to :user
  belongs_to :yardsale

  validates :street,   :presence => true
  validates :city,     :presence => true
  validates :state,    :presence => true
  validates :zip_code, :presence => true
end
