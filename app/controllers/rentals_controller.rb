class RentalsController < ApplicationController
 
  def checkout
    customer_id = params[:customer_id]
    movie_id = params[:movie_id]
    
    rental = Rental.new(rental_params)
    customer = Customer.find_by(id: customer_id)
    movie = Movie.find_by(id: movie_id)
    rental.due_date = DateTime.now + 7
    
    if rental.save
    render json: rental, status: :ok
    customer.checkout += 1
    # movie.inventory -= 1
    customer.save!
    else
      render json: { errors: ["Not Found"] }, status: :bad_request
    end
  end

  def check_in
    movie = Movie.find_by(params[:id])
    # movies_available = movie.available_inventory
    if movie
      render json: movie, status: :ok
    else
      render json: { errors: ["Not Found"] }, status: :bad_request
    end
  end

  
