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



  def has_won_horizontally?
    board_column = ['A', 'B', 'C', 'D', 'E', 'F', 'G']
    a = []
    b = []
    c = []
    d = []
    e = []
    f = []
    g = []
     full_board = [
       [".",".",".",".",".",".","."],
       [".",".",".",". ",".",".","."],
       [".",".",".",".",".",".","."],
       [".",".",".",".",".",".","."],
       [".",".",".",".",".",".","."],
       [".",".","x","x","x","x","."]
     ]
     counter = 0

     full_board.each_with_index do |row, row_index|
       row.each_with_index do |cell, cell_index|
         if cell_index == 3 && cell == "x"
           row.each do |x_index|
             if x_index == "x"
               counter += 1
               if counter == 4
                 return true
               end
             elsif x_index != "x"
               counter = 0
             end
           end
           # puts "#{row_index} x #{cell_index}"
         end
      end
    end
    puts counter
  end
end
