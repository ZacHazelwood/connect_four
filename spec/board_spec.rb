require './lib/board'
require 'pry'
describe Board do

  it "prints column headers" do

    board = Board.new
binding.pry
    board.print_board
    expect(board.print_board).to eq("A B C D E F G")
  end
end
