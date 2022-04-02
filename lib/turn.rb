require './lib/player'
require './lib/board'

class Turn

attr_reader :board, :player_input, :column

  def initialize(board)
    @board = board
    @player_input = ""
  end

  def take_turn
    # something like if/until there is or is not a ' . '
    # ask for A-G input
    # check if empty with ' . '
    # place X or O
  end

  def ask_input
    puts "Please choose a column by typing it's letter value."
    @player_input = gets.chomp.upcase
    until player_input == "A" || player_input == "B" || player_input == "C" || player_input == "D" || player_input == "E" || player_input == "F" || player_input == "G"
      puts "----- Invalid Input, Please try again. -----"
        @player_input = gets.chomp.upcase
    end
  end

  def transpose_columns(player_input)
    columns = {
        "A" => @board.full_board.transpose[0],
        "B" => @board.full_board.transpose[1],
        "C" => @board.full_board.transpose[2],
        "D" => @board.full_board.transpose[3],
        "E" => @board.full_board.transpose[4],
        "F" => @board.full_board.transpose[5],
        "G" => @board.full_board.transpose[6]
      }
      @column = columns[player_input]
  end

  def column_playable?
    if @column.include?('.')
      true
    end
  end

end
