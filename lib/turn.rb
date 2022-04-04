require './lib/player'
require './lib/board'

class Turn

attr_reader :board, :player_type, :column, :player_input, :column_header

  def initialize(board, player_type)
    @player_type = player_type
    @board = board
    @column = []
    @player_input = ""
# Added a new hash that assigns player_input values to the Column position of the full_board array
# When calling add_x or add_o, the playable piece will be assigned it's lowest row position, relative to the column header
    @column_header = {
      "A" => 0,
      "B" => 1,
      "C" => 2,
      "D" => 3,
      "E" => 4,
      "F" => 5,
      "G" => 6
    }
  end

# Transposes the full_board into columns associated to their letter value
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

# Simply counts the empty spaces within a selected column, and is then called
# upon by the #space_playable? method
  def space_empty
    @column.count do |empty_space|
      empty_space == "."
    end
  end

# Using self here calls upon the above #space_empty method and is referring to
# the empty_space variable from the #space_empty method.
  def space_playable?
    count = self.space_empty
      if count != 0
        true
      else
        false
      end
  end

# Checks the indexes of the column positions and subtracts 1 for an above placement
# Also, the subtract 1 references an array index, that begin at 0
  def column_lowest
    low_point = self.space_empty - 1
  end

# Requests player and computer input for the selection of a column
  def take_turn
    if @player_type == :human
      puts "Please select a column. Select A - G"
      @player_input = gets.chomp.upcase
    elsif @player_type == :computer
      puts "The computer will select a column."
# No need to request an input from the computer, so it randomly selects from the
# available columns A - G
      @player_input = (["A","B","C","D","E","F","G"]).sample
    end
  end

# Initially, the #take_turn method included an until statement to check the
# validity of the player input, but this was difficult to test with so many
# conditionals
  def input_valid?
    if ["A","B","C","D","E","F","G"].include?(@player_input)
      return true
    else
      return false
    end
  end
end
