class PlaysController < ApplicationController

  def index
  end

  def show
    @play = Play.find(params[:id])
    @board = @play.display_board
  end

  def make_move
    # raise
    play = Play.find(params[:play_id])
    symbol = play.next_piece
    play.moves.create(symbol: symbol, board_index: params[:board_index])
    redirect_to play_path(params[:play_id])
  end

end
