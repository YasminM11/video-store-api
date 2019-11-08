

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
      render json: movie.as_json(only: JSON_KEYS) #status: :ok
      return
    else
      render json: { errors: ["Not Found"] }, status: :not_found
      return
    end
  end

  def create
    movie = Movie.new([:title, :overview, :release_date, :inventory])

    if movie.save
      render json: movie.as_json(only: [:id]), status: :created
      return
    else
      render json: {ok: false, errors: new_pet.errors.messages}
      return
    end
  end
    

  private
    def movie_params
      params.require(:movie).permit(:id, :title, :overview, :relase_date, :inventory)
    end
end

