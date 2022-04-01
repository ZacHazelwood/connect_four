require './lib/board'
require './lib/player'
require './lib/turn'

class Game

attr_reader :player1, :player2, :board

  def initialize
    # @player1 = PLayer.new(...)
      # initialize Player.new
    # @player2 = Player.new(...)
      # initialize a computer
    @board = Board.new

    #establish turns to be begin initialization somehow

  end

  def game_open
    puts "WELCOME TO CONNECT FOUR!"
    puts "Please enter 'p' to play, or 'q' to quit."
    input = gets.chomp.downcase
      until input == 'p' || input == 'q'
        puts "Please try again."
        input = gets.chomp.downcase
      end
    case input
    when 'p'
      start
    when 'q'
      exit!
    end

  end

  def start
    @full_board.print_board
  end

end
