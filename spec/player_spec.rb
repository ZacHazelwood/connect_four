require 'rspec'
require './lib/board'
require './lib/player'

RSpec.describe Player do
  it "Player exists" do

    board = Board.new
    player = Player.new(board)

    expect(player).to be_an_instance_of(Player)
  end

  xit "Player has_won?" do

    board = Board.new
    player = Player.new(board)

    expect().to eq(true)
    expect().to eq(false)
  end

end
