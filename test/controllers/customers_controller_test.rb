require "test_helper"

CUSTOMER_KEYS = ["id", "name", 'address', "city", "state", "postal_code", "phone"]

describe CustomersController do
  describe "index" do

    it "responds with JSON, success, and an array of customer hashes" do
      get customers_path
      expect(response.header['Content-Type']).must_include 'json'
      must_respond_with :ok
    end

    it "responds with accurate list of customers" do

      get customers_path
      body = JSON.parse(response.body)

      body.each do |customer|
        expect(customer).must_be_instance_of Hash
        expect(customer.keys.sort).must_equal CUSTOMER_KEYS.sort
      end
    end
  

    it "will respond with an empty array when there are no customers" do
      # Arrange
      Customer.destroy_all

      # Act
      get customers_path
      body = JSON.parse(response.body)

      # Assert
      expect(body).must_be_instance_of Array
      expect(body).must_equal []
    end
  end
end

