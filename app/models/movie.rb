class Movie < ApplicationRecord

    has_many :rentals
    validates :title, presence: true, on: :create
    validates :overview, presence: true, on: :create
    validates :release_date, presence: true, on: :create
    validates :inventory, presence: true, numericality: true, on: :create
    
end
