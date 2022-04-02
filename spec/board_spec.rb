require './lib/board'
require 'pry'

RSpec.describe Board do
  it "Board exists" do
    board = Board.new

    expect(board).to be_an_instance_of(Board)
end

  it "board has 7 arrays" do
    board = Board.new

    expect(board.board_column.join(' ')).to eq("A B C D E F G")
    expect(board.full_board).to eq([[".", ".", ".", ".", ".", ".", "."],
                                    [".", ".", ".", ".", ".", ".", "."],
                                    [".", ".", ".", ".", ".", ".", "."],
                                    [".", ".", ".", ".", ".", ".", "."],
                                    [".", ".", ".", ".", ".", ".", "."],
                                    [".", ".", ".", ".", ".", ".", "."]])
  end

  it "player connects 4 pieces horizontally" do
    board = Board.new

    expect(board.has_won_horizontally?).to eq true
  end





# The player connects four of their pieces horizontally, vertically, or diagonally.
# The computer connects four of their pieces horizontally, vertically, or diagonally.
# The player cannot select a valid column.
# The program reports the appropriate endgame status
# Game returns user back to the Main Menu
end
