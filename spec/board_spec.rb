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

  it "can add x to board" do
    board = Board.new
    # binding.pry
    board.add_x(5, 0)
    board.print_board

    expect(board.full_board[5][0].include?('X')).to be(true)
  end

  it "can add o to board" do
    board = Board.new
    board.add_x(5, 0)
    board.add_o(2, 2)
    board.print_board

    expect(board.full_board[2][2].include?('O')).to be(true)
  end

  xit "adds piece" do
    board = Board.new


  end
end
