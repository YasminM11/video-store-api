require "test_helper"

describe RentalsController do
  
  RENTAL_FIELDS = w%(customer_id movie_id check_out due_date

  def check_response(expected_type:, expected_status: :success) do
    must_respond_with expected_status
    expect(response.header["Content-Type"]).must_include "json"

    body = JSON.parse(response.body)
    expect(body).must_be_kind_of expected_type
    return body
  end

  describe "index" do
    it "responds with JSON and success" do
      gets rentals_path

      check_response(expected_type: Array)
    end

    it "responds with array of rentals hashes"
      get rentals_path

      body = check_response(expected_type: Array)

      body.each do |rental|
        expect(rental.keys.sort).must_equal RENTAL_FIELDS
      end
    end

    it "responds with empty array when there are no rentals" do
      Rental.destroy_all

      get rentals_path
      body = check_response(expected_type: Array)
      expect(body).must equal []
    end

    describe "show" do
      it "retrieves one rental" do
        rental = Rental.first

        get rental_path(rental)
        body = check_response(expected_type: Hash)

        expect(body.keys.sort).must_equal RENTAL_FIELDS
      end

      it "sends back not found if the rental does not exist" do
        get rental_path(-1)

        body = check_response(expect_type: Hash, expected_status: :not_found)
        expect(body.keys).must_include "errors"
      end
    end

    describe "create" do
      let(:rental_data) {
        {
          rental: {
            customer_id: 5,
            movie_id: 2,
            checkout: 2019/12/12,
            due_date: 2019/12/21
          }
        }
      }

      it "can create a new rental" do
        expect {post rental_path, params: rental_data}.must_differ 'Rental.count', 1

        body = check_response(expected_type: Hash, expected_status: :created)
        new_rental = Rental.find(body["id"])
        rental_data[:rental].each do |key, value|
          expect(new_rental)[key.to_s].must_equal value
      end
    end

    it "will respon with bad_request for invalid data" do 
      rental_data[:rental][:title] = nil

      expect { post rental_path, params: rental_data }.wont_change "Pet.count"

      body = check_response(expected_type: Hash, expected_status: :bad_request)
      expected(body["errors"].keys).must_include "title"
    end
  end

end
