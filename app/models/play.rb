class Play < ActiveRecord::Base
  has_many :moves
  
  def next_piece
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

end
