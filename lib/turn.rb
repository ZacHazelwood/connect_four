require './lib/player'
require './lib/board'

class Turn

attr_reader :board, :player_type

  def initialize(board, player_type)
    @player_type = player_type
    @board = board
  end

  
end
