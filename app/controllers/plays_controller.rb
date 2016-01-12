class PlaysController < ApplicationController

  before_action :authenticate_user!

  def index
    @plays = Play.all
  end

  def new
    game = (params[:format])
    @play = Play.new(game_id: game)
    @games = GameDetail.all
  end

  def create
    game_id = params[:play][:game_id]
    play = Play.create(user_id: current_user.id, game_id: game_id)
    redirect_to play_path(play)
  end

  def show
    @play = Play.find(params[:id])
    @board = @play.display_board
    @symbol = @play.current_piece
  end

  def game_over
    @play = Play.find(params[:play_id])
    @result = params[:result]
    @board = @play.display_board
    @symbol = params[:symbol]
  end

  def make_move
    # raise
    play = Play.find(params[:play_id])
    symbol = play.current_piece
    play.moves.create(symbol: symbol, board_index: params[:board_index])
    if play.has_won?(symbol)
      redirect_to play_game_over_path(play, { play_id: play.id, result: "win", symbol: symbol })
    elsif play.board_full?
      redirect_to play_game_over_path(play, { play_id: play.id, result: "draw" })
    else
      redirect_to play_path(params[:play_id])
    end
  end

end
