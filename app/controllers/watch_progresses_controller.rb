class WatchProgressesController < ApplicationController
  def create
    @movie = Movie.find(params[:id])
    current_user.watch_progresses.create!(movie_id: @movie_id)
  end

  def destroy
    @movie = Movie.find(params[:id])
    current_user.watch_progresses.find_by(movie_id: @movie_id).destroy!
  end
end
