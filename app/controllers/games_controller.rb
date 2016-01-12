class GamesController < ApplicationController

  def index
  end

  def show
    @game = GameDetail.find(params[:id])
    @board = [0,0,1,2,0,0,0,0,0]
    @turn = 1
  end

  def make_move
    raise
    redirect_to game_path(params[:game_id])
  end

end
