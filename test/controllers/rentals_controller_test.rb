require "test_helper"

describe RentalsController do

  # RENTAL_FIELDS = [ "customer_id", "movie_id", "check_out", "due_date"]

  before do
    @rental = {
        customer_id: 12,
        movie_id: 2,
        checkout_out: 2019/12/12,
        due_date: 2019/12/19
    }
  end

  describe "checkout" do
    it "it responds with success when given valid data" do
      expect{ post checkout_path, params: @rental }.must_differ 'Rental.count', 1
      must_respond_with :success
    
      body = JSON.parse(response.body)
      expect(body.keys).must_equal ["id"]
    end

    it "it returns an error for invalid rental data" do
      @rental[:customer_id] = nil

      expect{post checkout_path, params: @rental }.wont_change "Rental.count"
      must_respond_with :bad_request

      body = JSON.parse(response.body)
      expect(body.keys).must_include "errors"
    end
  end
end
