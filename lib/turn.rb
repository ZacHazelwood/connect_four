require './lib/player'
require './lib/board'

class Turn

  def initialize(board)
    @board = board
    @player_input = ""
  end

  def do_turn
    # something like if/until there is or is not a ' . '
    # ask for A-G input
    # check if empty with ' . '
    # place X or O
  end

  def add_x(row, col)
    @full_board[row][col] = "X"
  end

  def add_o
    @full_board[row][col] = "O"
  end

end
