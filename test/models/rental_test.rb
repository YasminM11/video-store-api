require "test_helper"

describe Rental do

  describe "validations" do
    describe "customer id validation" do
      it "is invalid without a customer id" do
        customer_id = customer_id(:customer_id)
        rental.customer_id = nil

        result = rental.valid?
        expect(result).must_equal false
      end

      it "is valid with a customer id" do
       customer_id = customer_id(:customer_id)
       rental.customer_id = 2

        # Act
        result = rental.valid?
        expect(result).must_equal true
      end
    end

end
