class RentalsController < ApplicationController

  # def index
  #  @rentals = Rental.all
  #   rental = Rental.all.as_json(only: [:customer_id, :movie_id, :checkout, :due_date])
  #   render json: rental, status: :ok
  # end

  def check_out
    customer_id = params[:customer_id]
    movie_id = params [:movie_id]
    rental = Rental.new(rental_params)

    customer = Customer.find_by(id: customer_id)
    movie = Movie.find_by(id: movie_id)
    rental.due_date = DateTime.now + 7

    if rental.save
    render json: rental, status: :ok
    customer.checkout += 1
    customer.save!
    else  
      render json: { errors: ["Not Found"] }, status: :bad_request
    end
  end

  def check_in

    movie = Movie.find_by(rental_params[:movie_id])

    movies_available = movie.available_inventory

    if movie.nil?
    render json: { errors: ["Not Found"] }, status: :bad_request
    elsif  movies_available
      render json: movie, status: :ok
    else
      render_error
    end
  end

  private

  def rental_params
    params.permit(:id, :customer_id, :movie_id, :checkout, :due_date)
  end
end




  # def show
  #   rental = Rental.find_by(id: params:[:id])
  #     if rental
  #       render json: rental.as_json(only: [:id, :customer_id, :movie_id, :checkout, :due_date])
  #       return
  #     else
  #       render json: { ok: false, errors: ["Not Found"] }, status: :not_found
  #       return
  #     end
  # end

  # def create
  #   rental = Rental.new(rental_params)
  #   if rental.save
  #     render json: rental.as_json(only: [:id]), status: :created
  #     return
  #   else
  #     render json: {ok: false, errors: rental.errors.messages }, status: :bad_request
  #     return
  #   end
  # end

  
