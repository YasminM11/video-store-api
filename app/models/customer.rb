class Customer < ApplicationRecord
  
  has_many :rentals

# validations
validates :name, presence: true, uniqueness: true

end
