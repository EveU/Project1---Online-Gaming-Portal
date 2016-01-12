class Play < ActiveRecord::Base
  has_many :moves
  
  WINNING_LINES = [ [0,1,2],[0,3,6],[0,4,8],[1,4,7],[2,4,6],[2,5,8],[3,4,5],[6,7,8] ]

  def current_piece
    number_of_moves = self.moves.count
    if number_of_moves.even?
      "X"
    else
      "O"
    end
  end

  def display_board
    board = [nil,nil,nil,nil,nil,nil,nil,nil,nil]
    self.moves.each do |move|
      board[move.board_index] = move.symbol
    end
    board
  end

  def check_for_win
    status = "in progress"
    if has_won?(current_piece)
      "won"
    elsif board_full?
      "draw"
    else
    end
    status
  end

  def has_won?(symbol)
    load_board
    WINNING_LINES.each do |wl|
      wl.all? { || }
    end

    # def check_lines
    #   if WINS.any? { |line| line.all? { |square| @squares[square] == @player } }
    #     @win = @player
    #   end
    # end
  end

  def board_full?(symbol)
    load_board.all?
  end

end
