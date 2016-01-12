class PlaysController < ApplicationController

  def index
  end

  def show
    @play = Play.find(params[:id])
    @board = [0,0,1,2,0,0,0,0,0]
    @turn = 1
  end

  def make_move
    raise
    redirect_to play_path(params[:play_id])
  end

end
