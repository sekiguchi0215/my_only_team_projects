class MoviesController < ApplicationController
  def index
    if params[:genre] == "php"
      @movies = Movie.where(genre: Movie::PHP_GENRE_LIST)
    else
      @movies = Movie.where(genre: Movie::RAILS_GENRE_LIST)
    end
  end

  def show; end
end
