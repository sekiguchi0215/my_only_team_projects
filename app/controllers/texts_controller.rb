class TextsController < ApplicationController
  def index
    if params[:genre] == "php"
      @texts = Text.where(genre: Text::PHP_GENRE_LIST)
    else
      @texts = Text.where(genre: Text::RAILS_GENRE_LIST)
    end
  end

  def show
    @text = Text.find(params[:id])
  end
end
