

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
end
