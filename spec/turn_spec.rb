require './lib/turn'
require './lib/board'

describe Turn do

  it "exists" do
    turn = Turn.new Board.new

    expect(turn).to be_an_instance_of(Turn)
  end

  xit "asks for input" do



  end

  it "checks for playable columns" do
    turn = Turn.new Board.new
    turn.transpose_columns("A")

    expect(turn.column_playable?).to be(true)
  end

end
