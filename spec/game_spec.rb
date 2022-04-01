require './lib/game'
require './lib/board'
require 'pry'

describe Game do

  it "exists" do
    game = Game.new

    expect(game).to be_an_instance_of(Game)
  end

  it "opens with welcome message" do
    game = Game.new
    game.game_open
    expect().to
  end

end
