class PlaysController < ApplicationController

  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    # game = (params[:format])
    # @play = Play.new(game_id: game)
    @play = Play.new
    @games = GameDetail.all
    @users = User.all.reject {|user| user == current_user}
  end

  def create
    game_id = params[:play][:game_id].to_i
    opponent_id = params[:play][:opponent_id]
    if GameDetail.find(game_id).availability == "available"
      play = Play.create(user_id: current_user.id, game_id: game_id, opponent_id: opponent_id)
      redirect_to play_path(play)
    else
      message = "Sorry, that game is not available."
      redirect_to game_details_path( { message: message } )
    end
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
      play.update(winner_id: current_user.id)
      redirect_to play_game_over_path(play, { play_id: play.id, result: "win", symbol: symbol })
    elsif play.board_full?
      play.update(winner_id: 0)
      redirect_to play_game_over_path(play, { play_id: play.id, result: "draw" })
    else
      redirect_to play_path(params[:play_id])
    end
  end

end
