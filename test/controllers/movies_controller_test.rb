require "test_helper"

describe MoviesController do
 
  describe index do

    it "responds with json and responds with success" do
      gets movies_path
      expect(response.header["Content-Type"]).must_include 'json'
      must_respond_with :ok
    end

    it "provides the expected array of movies" do
      get movies_path
      body = JSON.parse(response.body)

      expect(body).must_be_instance_of array
      body.each do |movie|
        expect(movie).must_be_instance_of Hash
        expect(movie.keys.sort).must_equal["title", "overview", "release_date", "inventory"]
      end
    end

    it "responds with empty array when there are no movies" do
      Movies.destroy_all

      get movies_path
      body = JSON.parse(response.body)

      expect(body).must_be_instance_of array
      expect(body).must_equal []
    end
  end

end
