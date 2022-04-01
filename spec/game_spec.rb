require './lib/game'
require './lib/board'
require 'pry'

RSpec.describe Game do
  it "exists" do
    game = Game.new

    expect(game).to be_an_instance_of(Game)
  end

  xit "welcome message" do
    game = Game.new

    expect(game.game_open).to eq()
  end

  xit "start game" do
    game = Game.new

    expect().to eq()
  end
end
