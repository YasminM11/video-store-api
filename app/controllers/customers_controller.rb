
class CustomersController < ApplicationController
  JSON_KEYS = [:id, :name, :register_at, :address, :city, :state, :postal_code, :phone]

  def index
    customers = Customer.all.as_json(only: JSON_KEYS)
    render json: customers, status: :ok
  end


  private
  def customer_params
    params.permit(:id, :name, :register_at, :address, :city, :state, :postal_code, :phone)
  end

end
