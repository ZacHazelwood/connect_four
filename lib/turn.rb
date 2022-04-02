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

end
