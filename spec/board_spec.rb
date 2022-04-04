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
    board1 = Board.new
    board2 = Board.new
    board3 = Board.new
    board4 = Board.new

    board.full_board = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".","x","o",".",".",".","."],
      [".","o","x","x","x","x","o"]
    ]

    board1.full_board = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".","x",".",".",".","."],
      [".","x","o","o",".",".","."],
      [".","o","x","o","x","x","o"]
    ]

    board2.full_board = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".","x",".",".",".","."],
      [".","x","o","o",".",".","."],
      [".","o","x","o","o","o","o"]
    ]

    board3.full_board = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".","x",".",".",".","."],
      [".","x","o","o",".",".","."],
      [".","o","x","x","x","o","o"]
    ]

    board4.full_board = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".","x","o",".",".",".","."],
      [".","o","x","o","x","x","x"]
    ]

    expect(board.has_won_horizontally?).to eq true
    expect(board1.has_won_horizontally?).to eq false
    expect(board2.has_won_horizontally?).to eq true
    expect(board3.has_won_horizontally?).to eq false
    expect(board4.has_won_horizontally?).to eq false
  end

  it "player connects 4 pieces vertically" do
    board = Board.new
    board1 = Board.new
    board2 = Board.new
    board3 = Board.new
    board4 = Board.new

    board.full_board = [
      [".",".","x",".",".",".","."],
      [".",".","x",".",".",".","."],
      [".",".","x",".",".",".","."],
      [".",".","x",".",".",".","."],
      [".","x","o",".",".",".","."],
      [".","o","x","x","x","x","o"]
    ]

    board1.full_board = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".","x","o",".",".","."],
      [".","x","o","o",".",".","."],
      [".","o","x","o","x","x","o"]
    ]

    board2.full_board = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".","o",".","."],
      [".",".","x","x","o",".","."],
      [".","x","o","o","o",".","."],
      [".","o","x","o","o","o","o"]
    ]

    board3.full_board = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".","x",".",".",".","."],
      [".","x","o","o",".",".","."],
      [".","o","x","x","x","o","o"]
    ]

    board4.full_board = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".","x",".",".",".","."],
      [".","x","x","o",".",".","."],
      [".","o","x","x","x","o","o"]
    ]

    expect(board.has_won_vertically?).to eq true
    expect(board1.has_won_vertically?).to eq false
    expect(board2.has_won_vertically?).to eq true
    expect(board3.has_won_vertically?).to eq false
    expect(board4.has_won_vertically?).to eq false
  end

  it "player connects 4 pieces diagonally" do
    board = Board.new
    board1 = Board.new
    board2 = Board.new
    board3 = Board.new
    board4 = Board.new

    board.full_board = [
      ["x",".",".",".",".",".","."],
      [".","x",".",".",".",".","."],
      [".",".","x","o",".",".","."],
      [".",".","x","x",".",".","."],
      [".","x","o","o",".",".","."],
      ["x","o","x","x","o","x","o"]
    ]

    board1.full_board = [
      [".",".","x",".",".",".","."],
      [".",".","o","x",".",".","."],
      [".",".","x","o","x",".","."],
      [".",".","x","o","x","x","."],
      [".","x","o","x","o","o","."],
      [".","o","x","o","x","x","o"]
    ]

    board2.full_board = [
      [".",".",".",".","x",".","."],
      [".",".",".",".",".","x","."],
      [".",".",".",".","o",".","x"],
      [".",".","x","x","o",".","."],
      [".","x","o","x","x",".","."],
      [".","o","x","o","x","o","o"]
    ]

    board3.full_board = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".","x",".",".",".","."],
      [".","x","o","o",".",".","."],
      ["x","o","x","x","x","o","o"]
    ]

    board4.full_board = [
      [".",".","o",".",".",".","."],
      [".",".","o","o",".",".","."],
      [".",".","x","x","o",".","."],
      [".",".","x","o","x","o","."],
      [".","x","o","x","o","o","."],
      [".","o","x","o","x","x","o"]
    ]

    expect(board.has_won_diagonally?).to eq true
    expect(board1.has_won_diagonally?).to eq true
    expect(board2.has_won_diagonally?).to eq false
    expect(board3.has_won_diagonally?).to eq false
    expect(board4.has_won_diagonally?).to eq true
  end

  it "has_won_diagonlly_negative" do
    board = Board.new
    board1 = Board.new
    board2 = Board.new
    board3 = Board.new

    board.full_board = [
      [".",".",".",".",".",".","o"],
      [".",".",".",".",".","o","x"],
      [".",".",".",".","o","o","o"],
      [".",".",".","o","x","x","x"],
      [".",".",".","x","o","x","o"],
      [".",".",".","x","o","x","o"]
    ]

    board1.full_board = [
      [".",".","o",".",".",".","."],
      [".","o",".",".",".",".","."],
      ["o",".",".",".",".",".","."],
      [".",".",".","x",".",".","."],
      [".",".","x","o",".",".","."],
      ["x",".","x","x",".",".","o"]
    ]

    board2.full_board = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".","o","x",".",".","."],
      [".","o","x","o",".",".","."],
      ["o",".","x","x",".",".","o"]
    ]

    board3.full_board = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".","x","."],
      [".",".",".",".","x","o","."],
      [".",".",".","x","o","o","."],
      [".",".","x","x","o","x","."]
    ]

    expect(board.has_won_diagonally_negative?).to eq true
    expect(board1.has_won_diagonally_negative?).to eq false
    expect(board2.has_won_diagonally_negative?).to eq false
    expect(board3.has_won_diagonally_negative?).to eq true
  end

end
