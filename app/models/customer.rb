class Customer < ApplicationRecord
  
  has_many :rentals

# validations
validates :name, presence: true, uniqueness: true
validates :address, presence: true, uniqueness: true
validates :city, presence: true, uniqueness: true
validates :state, presence: true, uniqueness: true
validates :postal_code, presence: true, uniqueness: true
validates :phone, presence: true, uniqueness: true


end
