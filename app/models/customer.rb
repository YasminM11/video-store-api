class Customer < ApplicationRecord
  
  has_many :rental

# validations
validates :name, presence: true, uniqueness: true

end
