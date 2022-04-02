require './lib/turn'
require './lib/player'
require './lib/board'
require 'pry'

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

  it "can accept player input" do
    board = Board.new
    player_1 = Player.new(:human)
    turn = Turn.new(board, player_1.type)

    turn.stub(:gets).and_return("A")
    # Searched for ways to test user input and found .stub and comparable mocks
    # This allows the test to assign a gets.chomp value directly within the test
    expect(turn.take_turn).to eq("A")
  end

  it "can take input and assign a column" do
    board = Board.new
    player_1 = Player.new(:human)
    turn = Turn.new(board, player_1.type)

    turn.take_turn
    allow(turn).to receive(:gets).and_return("A")
    # turn.stub(:gets).and_return("A")
    # Was receiving an error stating that the syntax has changed
    # My research led me to discover the allow() method, which functions the same
    expect(turn.assign_column("A")).to eq([".", ".", ".", ".", ".", "."])
  end

  it "randomly selects column for computer" do
    board = Board.new
    player_1 = Player.new(:computer)
    turn = Turn.new(board, player_1.type)

    turn.take_turn
    turn.stub(:select).and_return("A")
    # .stub(:select) allows for the test to select one of the variables within the player_input array available to the computer
    expect(turn.assign_column("A")).to eq([".", ".", ".", ".", ".", "."])
  end

  # After failing at the first attempt at take_turn, I established the #input_valid? method
  # Will test input validity
  it "checks valid input" do
    board = Board.new
    player_1 = Player.new(:computer)
    turn = Turn.new(board, player_1.type)

    turn.take_turn
    turn.stub(:gets).and_return("Z")
    expect(turn.input_valid?).to eq(false)
  end


end
