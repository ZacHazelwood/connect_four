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

  it "can assign player input to a column position" do
    board = Board.new
    player_1 = Player.new(:human)
    turn = Turn.new(board, player_1.type)

    turn.assign_column("A")
    expect(turn.column).to eq([".", ".", ".", ".", ".", "."])
  end

  it "can transpose columns from the full board" do
    board = Board.new
    player_1 = Player.new(:human)
    turn = Turn.new(board, player_1.type)

    turn.board.add_x(5, 0)
    turn.assign_column("A")
    expect(turn.column).to eq([".", ".", ".", ".", ".", "X"])
  end

end
