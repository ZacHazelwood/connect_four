require './lib/game'
require './lib/board'
require 'pry'

RSpec.describe Game do
  it "exists" do
    game = Game.new

    expect(game).to be_an_instance_of(Game)
  end

  it "can read attributes" do
    game = Game.new

    expect(game.human_player.type).to eq(:human)
    expect(game.comp_player.type).to eq(:computer)
  end
end
