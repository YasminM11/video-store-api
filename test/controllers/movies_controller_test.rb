require "test_helper"

JSON_KEYS = ["id", "title", "overview", "release_date", "inventory"]

describe MoviesController do
 
  describe 'index' do

    it "responds with JSON and responds with success" do
      get movies_path

      expect(response.header["Content-Type"]).must_include 'json'
      must_respond_with :ok
    end

    it "provides the expected array of movies" do
      get movies_path
      body = JSON.parse(response.body)

      expect(body).must_be_instance_of Array
      body.each do |movie|
        expect(movie).must_be_instance_of Hash
        expect(movie.keys.sort).must_equal ["id", "title", "overview", "release_date", "inventory"].sort
      end
    end

    it "responds with empty array when there are no movies" do
      Movie.destroy_all

      get movies_path
      body = JSON.parse(response.body)

      expect(body).must_be_instance_of Array
      expect(body).must_equal []
    end
  end

  
  describe "show" do
    
    it "accurately retrieves the information for a movie" do
      movie = movies(:movie1)

      get movie_path(movie.id)
      expect(movie).must_be_instance_of Movie
    end

   
    it "returns not found if the movie does not exist" do
      
      get movie_path(-1)    
      must_respond_with :not_found
  
      body = check_response(expected_type: Hash, expected_status: :not_found)
      expect(body.keys).must_include "errors"    
  end

  end


end


