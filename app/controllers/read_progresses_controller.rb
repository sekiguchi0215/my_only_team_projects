class ReadProgressesController < ApplicationController
  def create
    current_user.read_progresses.create!(text_id: params[:text_id])
    redirect_to request.referer
  end

  def destroy
    current_user.read_progresses.find_by(text_id: params[:text_id]).destroy!
    redirect_to request.referer
  end
end
