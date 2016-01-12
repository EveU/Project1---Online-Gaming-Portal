class GameDetailsController < ApplicationController
  def index
    @games = GameDetail.all
  end

  def show
    @game = GameDetail.find(params[:id])
  end

end