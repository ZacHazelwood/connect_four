

class Board

attr_reader :full_board, :board_column

  # def initialize
  #   @full_board = {
  #     :row0 => ['A', 'B', 'C', 'D', 'E', 'F', 'G'],
  #     :row1 => [Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new],
  #     :row2 => [Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new],
  #     :row3 => [Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new],
  #     :row4 => [Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new],
  #     :row5 => [Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new],
  #     :row6 => [Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new]
  #   }
  # end

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
