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

  def has_won_horizontally
     counter = 0
     @full_board.each_with_index do |row, row_index|
       row.each_with_index do |cell, cell_index|
         if counter == 4
           return true
         end
         if cell_index == 3 && cell == "X" || cell_index == 3 && cell == "O"
           row.each_with_index do |cell_position, index|
             if cell_position == "X"
               counter += 1
               if counter == 4
                 puts "Congradulations, Human. You Win!"
                 return true
               end
               if row[index + 1] != "X" && counter != 4
                 counter = 0
               end
             end
             if cell_position == "O"
               counter += 1
               if counter == 4
                 puts "The computer Wins!"
                 return true
               end
                if row[index + 1] != "O" && counter != 4
                  counter = 0
                end
             end
           end
         end
      end
    end
    return false
  end


  def has_won_vertically
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
          if cell_position == "X"
            counter += 1
            if counter == 4
              puts "Congradulations, Human! You Win!"
              return true
            end
            if array[index + 1] != "X" && counter != 4
              counter = 0
            end
          end
          if cell_position == "O"
            counter += 1
            if counter == 4
              puts "The computer Wins!"
              return true
            end
             if array[index + 1] != "O" && counter != 4
               counter = 0
             end
          end
        end
      end
    return false
  end

  def has_won_diagonally

    @full_board.each_with_index do |row, row_index|
      row.each_with_index do |cell, cell_index|
        if cell == "X"
          if cell_index + 1 < row.length && row_index + 1 < @full_board.length
            if @full_board[row_index + 1][cell_index + 1] == "X"
              if cell_index + 2 < row.length && row_index + 2 < @full_board.length
                if @full_board[row_index + 2][cell_index + 2] == "X"
                  if cell_index + 3 < row.length && row_index + 3 < @full_board.length
                    if @full_board[row_index + 3][cell_index + 3] == "X"
                      puts "Congradulations, Human! You Win!"
                      return true
                    end
                  end
                end
              end
            end
          end
        end
        if cell == "O"
          if cell_index + 1 < row.length && row_index + 1 < @full_board.length
            if @full_board[row_index + 1][cell_index + 1] == "O"
              if cell_index + 2 < row.length && row_index + 2 < @full_board.length
                if @full_board[row_index + 2][cell_index + 2] == "O"
                  if cell_index + 3 < row.length && row_index + 3 < @full_board.length
                    if @full_board[row_index + 3][cell_index + 3] == "O"
                      puts "The computer Wins!"
                      return true
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    return false
  end

  def has_won_diagonally_negative

    @full_board.each_with_index do |row, row_index|
      row.each_with_index do |cell, cell_index|
        if cell == "X"
          if cell_index - 1 < row.length && row_index + 1 < @full_board.length
            if @full_board[row_index + 1][cell_index - 1] == "X"
              if cell_index - 2 < row.length && row_index + 2 < @full_board.length
                if @full_board[row_index + 2][cell_index - 2] == "X"
                  if cell_index - 3 < row.length && row_index + 3 < @full_board.length
                    if @full_board[row_index + 3][cell_index - 3] == "X"
                      puts "Congradulations, Human! You Win!"
                      return true
                    end
                  end
                end
              end
            end
          end
        end
        if cell == "O"
          if cell_index - 1 < row.length && row_index + 1 < @full_board.length
            if @full_board[row_index + 1][cell_index - 1] == "O"
              if cell_index - 2 < row.length && row_index + 2 < @full_board.length
                if @full_board[row_index + 2][cell_index - 2] == "O"
                  if cell_index - 3 < row.length && row_index + 3 < @full_board.length
                    if @full_board[row_index + 3][cell_index - 3] == "O"
                      puts "The computer Wins!"
                      return true
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    return false
  end

  def draw
    if @full_board[0].include?('.')
      return false
    else
      return true
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
