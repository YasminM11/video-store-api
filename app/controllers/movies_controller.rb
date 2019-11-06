KEYS = [:id, :title, :overview, :relase_date, :inventory]

class MoviesController < ApplicationController
  def index
    movies = Movie.all.as_json(only: KEYS)
    render json: movies, status: :ok
  end

  def show
    movie_id = params[:id]
    movie = Movie.find_by(id: movie_id)
    if movie
      render json: movie.as_json(only: KEYS) #status: :ok
      return
    else
      render json: movie, status: :not_found
      #render json: {"errors"=>["not found"]}, status: :not_found
      return
    end

    
  end

  private
    def pet_params
      params.require(:movie).permit(:id, :title, :overview, :relase_date, :inventory)
    end
end
