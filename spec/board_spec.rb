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
      [".","X","O",".",".",".","."],
      [".","O","X","X","X","X","O"]
    ]

    board1.full_board = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".","X",".",".",".","."],
      [".","X","O","O",".",".","."],
      [".","O","X","O","X","X","O"]
    ]

    board2.full_board = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".","X",".",".",".","."],
      [".","X","O","O",".",".","."],
      [".","O","X","O","O","O","O"]
    ]

    board3.full_board = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".","X",".",".",".","."],
      [".","X","O","O",".",".","."],
      [".","O","X","X","X","O","O"]
    ]

    board4.full_board = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".","X","O",".",".",".","."],
      [".","O","X","O","X","X","X"]
    ]

    expect(board.has_won_horizontally).to eq true
    expect(board1.has_won_horizontally).to eq false
    expect(board2.has_won_horizontally).to eq true
    expect(board3.has_won_horizontally).to eq false
    expect(board4.has_won_horizontally).to eq false
  end

  it "player connects 4 pieces vertically" do
    board = Board.new
    board1 = Board.new
    board2 = Board.new
    board3 = Board.new
    board4 = Board.new

    board.full_board = [
      [".",".","X",".",".",".","."],
      [".",".","X",".",".",".","."],
      [".",".","X",".",".",".","."],
      [".",".","X",".",".",".","."],
      [".","X","O",".",".",".","."],
      [".","O","X","X","X","X","O"]
    ]

    board1.full_board = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".","X","O",".",".","."],
      [".","X","O","O",".",".","."],
      [".","O","X","O","X","X","O"]
    ]

    board2.full_board = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".","O",".","."],
      [".",".","X","X","O",".","."],
      [".","X","O","O","O",".","."],
      [".","O","X","O","O","O","O"]
    ]

    board3.full_board = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".","X",".",".",".","."],
      [".","X","O","O",".",".","."],
      [".","O","X","X","X","O","O"]
    ]

    board4.full_board = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".","X",".",".",".","."],
      [".","X","X","O",".",".","."],
      [".","O","X","X","X","O","O"]
    ]

    expect(board.has_won_vertically).to eq true
    expect(board1.has_won_vertically).to eq false
    expect(board2.has_won_vertically).to eq true
    expect(board3.has_won_vertically).to eq false
    expect(board4.has_won_vertically).to eq false
  end

  it "player connects 4 pieces diagonally" do
    board = Board.new
    board1 = Board.new
    board2 = Board.new
    board3 = Board.new
    board4 = Board.new

    board.full_board = [
      ["X",".",".",".",".",".","."],
      [".","X",".",".",".",".","."],
      [".",".","X","O",".",".","."],
      [".",".","X","X",".",".","."],
      [".","X","O","O",".",".","."],
      ["X","O","X","X","O","X","O"]
    ]

    board1.full_board = [
      [".",".","X",".",".",".","."],
      [".",".","O","X",".",".","."],
      [".",".","X","O","X",".","."],
      [".",".","X","O","X","X","."],
      [".","X","O","X","O","O","."],
      [".","O","X","O","X","X","O"]
    ]

    board2.full_board = [
      [".",".",".",".","X",".","."],
      [".",".",".",".",".","X","."],
      [".",".",".",".","O",".","X"],
      [".",".","X","X","O",".","."],
      [".","X","O","X","X",".","."],
      [".","O","X","O","X","O","O"]
    ]

    board3.full_board = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".","X",".",".",".","."],
      [".","X","O","O",".",".","."],
      ["X","O","X","X","X","O","O"]
    ]

    board4.full_board = [
      [".",".","O",".",".",".","."],
      [".",".","O","O",".",".","."],
      [".",".","X","X","O",".","."],
      [".",".","X","O","X","O","."],
      [".","X","O","X","O","O","."],
      [".","O","X","O","X","X","O"]
    ]

    expect(board.has_won_diagonally).to eq true
    expect(board1.has_won_diagonally).to eq true
    expect(board2.has_won_diagonally).to eq false
    expect(board3.has_won_diagonally).to eq false
    expect(board4.has_won_diagonally).to eq true
  end

  it "has_won_diagonlly_negative" do
    board = Board.new
    board1 = Board.new
    board2 = Board.new
    board3 = Board.new

    board.full_board = [
      [".",".",".",".",".",".","O"],
      [".",".",".",".",".","O","X"],
      [".",".",".",".","O","O","O"],
      [".",".",".","O","X","X","X"],
      [".",".",".","X","O","X","O"],
      [".",".",".","X","O","X","O"]
    ]

    board1.full_board = [
      [".",".","O",".",".",".","."],
      [".","O",".",".",".",".","."],
      ["O",".",".",".",".",".","."],
      [".",".",".","X",".",".","."],
      [".",".","X","O",".",".","."],
      ["X",".","X","X",".",".","O"]
    ]

    board2.full_board = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".","O","X",".",".","."],
      [".","O","X","O",".",".","."],
      ["O",".","X","X",".",".","O"]
    ]

    board3.full_board = [
      [".",".",".",".",".",".","."],
      [".",".",".",".",".",".","."],
      [".",".",".",".",".","X","."],
      [".",".",".",".","X","O","."],
      [".",".",".","X","O","O","."],
      [".",".","X","X","O","X","."]
    ]

    expect(board.has_won_diagonally_negative).to eq true
    expect(board1.has_won_diagonally_negative).to eq false
    expect(board2.has_won_diagonally_negative).to eq false
    expect(board3.has_won_diagonally_negative).to eq true
  end

end
