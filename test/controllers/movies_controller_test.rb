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
        expect(movie.keys.sort).must_equal ["title", "overview", "release_date", "inventory"].sort
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

  describe "create" do
    before do
      @movie = {

          title: "The Net",
          overview: "A very convincing story of the perils of the internet",
          release_date: "1995/07/05",
          inventory: 2

      }
    end

    it "responds with created status when valid information is provided" do
      expect{ post movies_path, params: @movie}.must_differ 'Movie.count', 1
      must_respond_with :created
      
      body = JSON.parse(response.body)
      expect(body.keys).must_equal ["id"]
    end

    it "responds with bad_request when the request is given invalid information" do
      @movie[:title] = nil

      expect{post movies_path, params: @movie}.wont_change "Movie.count"
      must_respond_with :bad_request
      body = JSON.parse(response.body)
      expect(body.keys).must_include "errors"
    end
  end
end


