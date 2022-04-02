require './lib/player'
require './lib/board'

class Turn

attr_reader :board, :player_type, :column, :player_input

  def initialize(board, player_type)
    @player_type = player_type
    @board = board
    @column = []
    @player_input = ""
  end


  def assign_column(player_input)
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

  def space_empty
    @column.count do |empty_space|
      empty_space == "."
    end
  end

  def space_playable?
    count = self.space_empty
      if count != 0
        true
      else
        false
      end
  end

  def column_lowest
    low_point = self.space_empty - 1
  end

  def take_turn
    if @player_type == :human
      puts "Please select a column. Select A - G"
      @player_input = gets.chomp.upcase
    elsif @player_tpye == :computer
      puts "The computer will select a column."
      @player_input = (["A","B","C","D","E","F","G"]).sample
    end
  end

  def valid_input?
    ["A","B","C","D","E","F","G"].include?(@player_input)
  end
end


# This just didn't work, had too many conditionals and was throwing errors in my terminal.
# So I thought to condense the #take_turn method to just ask for input from the user,
# and will check for valididty of the input when asking for the turn to commence.

  # def take_turn
  #   if @player_type == :human
  #     puts "Please choose a column by typing it's letter value. Select A - G"
  #     @player_input = gets.chomp.upcase
  #     until player_input == "A" || player_input == "B" || player_input == "C" || player_input == "D" || player_input == "E" || player_input == "F" || player_input == "G"
  #       puts "----- Invalid Input. Please try again. Select A - G -----"
  #       @player_input = gets.chomp.upcase
  #     end
  #   elsif @player_type == :computer
  #     puts "The computer will select a column."
  #     @player_input = (["A", "B", "C", "D", "E", "F", "G"]).sample
  #     # .sample selects a random element within an array
  #   end
  # end
