require "test_helper"

describe RentalsController do

  RENTAL_FIELDS = [ "customer_id", "movie_id", "check_out", "due_date"]

  def check_response(expected_type:, expected_status: :success)
    must_respond_with expected_status
    expect(response.header["Content-Type"]).must_include "json"

    body = JSON.parse(response.body)
    expect(body).must_be_kind_of expected_type
    return body
  end
end