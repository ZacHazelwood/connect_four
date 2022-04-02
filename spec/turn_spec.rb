require './lib/turn'
require './lib/player'
require './lib/board'

describe Turn do

  it "exists" do
    board = Board.new
    player_1 = Player.new(:human)
    turn = Turn.new(board, player_1.type)

    expect(turn).to be_an_instance_of(Turn)
  end


end
