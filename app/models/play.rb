class Play < ActiveRecord::Base
  belongs_to :game_detail, :class_name => "GameDetail",
      :foreign_key => "game_id"
  belongs_to :user
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

  def has_won?(symbol)
    board = display_board
    indices = []
    win = false
    board.each_with_index do |sq, index|
      indices << index if sq == symbol
    end
    WINNING_LINES.each do |wl|
      if indices & wl == wl
        win = true
        return true
      end
    end
    win
  end

  def board_full?
    display_board.all?
  end

end
