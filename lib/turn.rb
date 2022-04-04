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
  def column_lowest
    low_point = self.space_empty - 1
  end

  def take_turn
    if @player_type == :human
      puts "Please select a column. Select A - G"
      @player_input = gets.chomp.upcase
    elsif @player_type == :computer
      puts "The computer will select a column."
      @player_input = (["A","B","C","D","E","F","G"]).sample
    end
  end

  def input_valid?
    if ["A","B","C","D","E","F","G"].include?(@player_input)
      return true
    else
      return false
    end
  end
end
