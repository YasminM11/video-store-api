class RentalsController < ApplicationController

  def index
   @rentals = Rental.all
    rental = Rental.all.as_json(only: [:customer_id, :movie_id, :checkout, :due_date])
    render json: rental, status: :ok
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


  private
    def rental_params
      params.require(:rental).permit(:id, :customer_id, :movie_id, :checkout, :due_date)
    end

end
