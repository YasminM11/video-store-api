
class MoviesController < ApplicationController
  JSON_KEYS = [:id, :title, :overview, :release_date, :inventory]

  def index
    movies = Movie.all
    render json: movies.as_json(only: JSON_KEYS), status: :ok
  end

  def show
    movie_id = params[:id]
    movie = Movie.find_by(id: movie_id)
    if movie
      render json: movie.as_json(only: JSON_KEYS), status: :ok
      
    else
      render json: { errors: ["Not Found"] }, status: :not_found
    end
  end

  def create
    new_movie = Movie.new(movie_params)

    if new_movie.save
      render json: new_movie.as_json(only: [:id]), status: :created
      return
    else
      render json: { errors: ["errors"] }, status: :bad_request
      return
    end
  end

  private

  def movie_params
    params.permit(:title, :overview, :release_date, :inventory)
  end
end
