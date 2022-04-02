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
    full_board = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".","x","o",".",".",".","."],
      [".","o","x","x","x","x","o"]
    ]

    full_board1 = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".","x",".",".",".","."],
      [".","x","o","o",".",".","."],
      [".","o","x","o","x","x","o"]
    ]

    full_board2 = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".","x",".",".",".","."],
      [".","x","o","o",".",".","."],
      [".","o","x","o","o","o","o"]
    ]

    full_board3 = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".","x",".",".",".","."],
      [".","x","o","o",".",".","."],
      [".","o","x","x","x","o","o"]
    ]

    expect(board.has_won_horizontally?(full_board)).to eq true
    expect(board.has_won_horizontally?(full_board1)).to eq false
    expect(board.has_won_horizontally?(full_board2)).to eq true
    expect(board.has_won_horizontally?(full_board3)).to eq false
  end

  it "player connects 4 pieces vertically" do
    board = Board.new
    full_board = [
      [".",".","x",".",".",".","."],
      [".",".","x",".",".",".","."],
      [".",".","x",".",".",".","."],
      [".",".","x",".",".",".","."],
      [".","x","o",".",".",".","."],
      [".","o","x","x","x","x","o"]
    ]

    full_board1 = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".","x","o",".",".","."],
      [".","x","o","o",".",".","."],
      [".","o","x","o","x","x","o"]
    ]

    full_board2 = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".","o",".","."],
      [".",".","x","x","o",".","."],
      [".","x","o","o","o",".","."],
      [".","o","x","o","o","o","o"]
    ]

    full_board3 = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".","x",".",".",".","."],
      [".","x","o","o",".",".","."],
      [".","o","x","x","x","o","o"]
    ]

    expect(board.has_won_vertically?(full_board)).to eq true
    expect(board.has_won_vertically?(full_board1)).to eq false
    expect(board.has_won_vertically?(full_board2)).to eq true
    expect(board.has_won_vertically?(full_board3)).to eq false
  end

  xit "player connects 4 pieces diagonally" do
    board = Board.new

    expect(board.has_won_diagonally?).to eq true
  end

end
