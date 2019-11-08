ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require "minitest/rails"

Minitest::Reporters.use!(
  Minitest::Reporters::SpecReporter.new,
  ENV,
  Minitest.backtrace_filter)
require 'minitest/autorun'
require 'minitest/reporters'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  
  def check_response(expected_type:, expected_status: :success)
    must_respond_with expected_status
    expect(response.header["Content-Type"]).must_include "json"
    body = JSON.parse(response.body)
    expect(body).must_be_kind_of expected_type
    return body
  end
  # Add more helper methods to be used by all tests here...
end
