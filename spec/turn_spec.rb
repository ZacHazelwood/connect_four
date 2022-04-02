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

  it "counts empty spaces in column" do
    board = Board.new
    player_1 = Player.new(:human)
    turn = Turn.new(board, player_1.type)

    turn.assign_column("A")
    expect(turn.space_empty).to eq(6)
  end

  it "checks column for playable spaces" do
    board = Board.new
    player_1 = Player.new(:human)
    turn = Turn.new(board, player_1.type)

    turn.assign_column("A")
    expect(turn.space_playable?).to eq(true)

    board.add_x(5, 1)
    board.add_x(4, 1)
    board.add_x(3, 1)
    board.add_x(2, 1)
    board.add_x(1, 1)
    board.add_x(0, 1)
    turn.assign_column("B")
    expect(turn.space_playable?).to eq(false)
  end

  it "checks the lowest point of a column" do
    board = Board.new
    player_1 = Player.new(:human)
    turn = Turn.new(board, player_1.type)

    turn.assign_column("A")
    expect(turn.column_lowest).to eq(5)
  end

end
