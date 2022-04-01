

class Board

attr_reader :full_board, :board_column

  def initialize
    @board_column = ['A', 'B', 'C', 'D', 'E', 'F', 'G']
    @full_board = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."]
    ]
  end

  def print_board
    puts @board_column.join(' ')
    @full_board.each do |row|
      puts row.join(' ')
    end
  end

  def add_x(row, col)
    # binding.pry
    @full_board[row][col] = "X"
  end

  def add_o(row, col)
    @full_board[row][col] = "O"
  end

  # def add_piece(col, player)
  #
  # end

end
