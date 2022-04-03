require 'pry'
class Board

attr_reader :board_column 
attr_accessor :full_board

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
     counter = 0
     @full_board.each_with_index do |row, row_index|
       row.each_with_index do |cell, cell_index|
         if counter == 4
           return true
         end
         if cell_index == 3 && cell == "x" || cell_index == 3 && cell == "o"
           row.each_with_index do |cell_position, index|
             if cell_position == "x"
               counter += 1
               if counter == 4
                 return true
               end
               if row[index + 1] != "x" && counter != 4
                 counter = 0
               end
             end
             if cell_position == "o"
               counter += 1
               if counter == 4
                 return true
               end
                if row[index + 1] != "o" && counter != 4
                  counter = 0
                end
             end
           end
         end
      end
    end
    return false
  end


  def has_won_vertically?
    a = []
    b = []
    c = []
    d = []
    e = []
    f = []
    g = []

    counter = 0

    @full_board.each_with_index do |row, row_index|
      row.each_with_index do |cell, cell_index|
          if cell_index == 0
            a << cell
          end
          if cell_index == 1
            b << cell
          end
          if cell_index == 2
            c << cell
          end
          if cell_index == 3
            d << cell
          end
          if cell_index == 4
            e << cell
          end
          if cell_index == 5
            f << cell
          end
          if cell_index == 6
            g << cell
          end
      end
    end
    turn_vertical_board = [a, b, c, d, e, f, g]
    turn_vertical_board.each do |array|
        array.each_with_index do |cell_position, index|
          if cell_position == "x"
            counter += 1
            if counter == 4
              return true
            end
            if array[index + 1] != "x" && counter != 4
              counter = 0
            end
          end
          if cell_position == "o"
            counter += 1
            if counter == 4
              return true
            end
             if array[index + 1] != "o" && counter != 4
               counter = 0
             end
          end
        end
      end
    return false
  end

  def has_won_diagonally?
    counter = 0

    @full_board.each_with_index do |row, row_index|
      row.each_with_index do |cell, cell_index|
          # binding.pry

          array.each_with_index do |cell_position, index|
            if cell_position == "x"
              counter += 1
              if counter == 4
                return true
              end
              if array[index + 1] != "x" && counter != 4
                counter = 0
              end
            end
            if cell_position == "o"
              counter += 1
              if counter == 4
                return true
              end
               if array[index + 1] != "o" && counter != 4
                 counter = 0
               end
            end
          end
        end
      return false
    end
  end


  def add_x(row, col)
    # binding.pry
    @full_board[row][col] = "X"
  end

  def add_o(row, col)
    @full_board[row][col] = "O"
  end

end
