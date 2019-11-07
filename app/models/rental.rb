class Rental < ApplicationRecord

    belongs_to :movies
    belongs_to :customers 
    
    validates :customer_id, presence: true
    validates :movie_id, presence: true
    validates :check_out, presence: true
    validates :return_date, presence: true
    
end
