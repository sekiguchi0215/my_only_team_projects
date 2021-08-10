class WatchProgressesController < ApplicationController
  def create
    current_user.watch_progresses.create!(movie_id: params[:movie_id])
    redirect_to request.referer
  end

  def destroy
    current_user.watch_progresses.find_by(movie_id: params[:movie_id]).destroy!
    redirect_to request.referer
  end
end
