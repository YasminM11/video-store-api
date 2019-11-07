require "test_helper"

describe Rental do

  describe "validations" do
    describe "customer id validation" do
      it "is invalid without a customer id" do
        customer_id = customer_id(:customer_id) #put yml key
        rental.customer_id = nil

        result = rental.valid?
        expect(result).must_equal false
      end

      it "is valid with a customer id" do
       customer_id = customer_id(:customer_id) #put yml key
       rental.customer_id = 2

        # Act
        result = rental.valid?
        expect(result).must_equal true
      end
    end

    describe "movie id validation" do
      it "is invalid without a movie id" do
        movie_id = movie_id(:movie_id) #put yml key
        rental.movie_id = nil

        result = rental.valid?
        expect(result).must_equal false
      end

      it "is valid with a movie id" do
       movie_id = movie_id(:movie_id) #put yml key
       rental.movie_id = 2

        # Act
        result = rental.valid?
        expect(result).must_equal true
      end
    end

    describe "checkout validation" do
      it "is invalid without a checkout date" do
        checkout = check_out(:checkout) #put yml key
        rental.customer_id = nil

        result = rental.valid?
        expect(result).must_equal false
      end

      it "is valid with a checkout date" do
        check_out = check_out(:checkout) #put yml key

        result = rental.valid?
        expect(result).must_equal true
      end
    end

    describe "due date validation" do
      it "is invalid without a due date" do
        due_date = due_date(:due_date) #put yml key
        rental.due_date = nil

        result = rental.valid?
        expect(result).must_equal false
      end

      it "is valid with a due date" do
       due_date = due_date(:due_date) #put yml key
     
        result = rental.valid?
        expect(result).must_equal true
      end
    end
  end

    # belongs to movie, check if a rental movie is instance of movie
    # belongs to customer, check if a rental customer is instance of customer
end


