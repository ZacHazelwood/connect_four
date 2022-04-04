require './lib/board'
require './lib/player'
require './lib/turn'
require 'pry'

class Game

attr_reader :human_player, :comp_player, :board, :human_turn, :comp_turn

  def initialize
    @human_player = Player.new(:human)
    @comp_player = Player.new(:computer)
    @board = Board.new
    @human_turn = Turn.new(@board, human_player.type)
    @comp_turn = Turn.new(@board, comp_player.type)
  end

  def game_open
    puts "WELCOME TO CONNECT FOUR!"
    puts "Please enter 'p' to play, or 'q' to quit."
    input = gets.chomp.downcase
      until input == 'p' || input == 'q'
        puts "Please try again."
        puts "Please enter 'p' to play, or 'q' to quit."
        input = gets.chomp.downcase
      end
# When requires a case, which is console input
    case input
    when 'p'
      game_start
    when 'q'
# Discovered the #exit! method that simply ends all ruby processes
      exit!
    end
  end

  def game_start
# Print the board at the beginning of every turn
# Check for win conditions, Check for valid input
# Until a winner is declared, keep pushing turns
    @board.print_board
    until @board.has_won_horizontally == true || @board.draw == true || @board.has_won_vertically == true || @board.has_won_diagonally == true || @board.has_won_diagonally_negative == true
      @human_turn.take_turn
        if @human_turn.input_valid? == false
          puts "Invalid Selection. Please select A - G."
          until @human_turn.input_valid? == true
            @human_turn.take_turn
          end
        end
# At first, we select a Column Header assignment, assuming the input is valid
        @human_turn.assign_column(@human_turn.player_input)
        @human_turn.space_empty
# Then, we check that the column and space is playable
          if @human_turn.space_playable? == false
            puts "No room left in this column, please Select another."
            until @human_turn.space_playable? == true
              @human_turn.take_turn
# Check for valid inputs again
              if @human_turn.input_valid? == false
                puts "Invalid Selection. Please select A - G."
                until @human_turn.input_valid? == true
                  @human_turn.take_turn
                end
              end
              @human_turn.assign_column(@human_turn.player_input)
            end
          end
# When everything checks out, the player drops their X to the cooresponding position
          @board.add_x(@human_turn.column_lowest, @human_turn.column_header[@human_turn.player_input])
# Then reprint the board as it has just been modified and check for win conditions
          @board.print_board
          @board.has_won_horizontally
            if @board.has_won_horizontally == true
              break
            end
          @board.has_won_vertically
            if @board.has_won_vertically == true
              break
            end
          @board.has_won_diagonally
            if @board.has_won_diagonally == true
              break
            end
          @board.has_won_diagonally_negative
            if @board.has_won_diagonally_negative == true
              break
            end
# Check for a DRAW last so the game can continue
          @board.draw
            if @board.draw == true
              break
            end
# Now it's the computer's turn
      @comp_turn.take_turn
      @comp_turn.assign_column(@comp_turn.player_input)
# Check that the computer's selections are valid
# The computer only needs to check that the column selection is playable, since
# there is no need to ask the computer for direct input
        if @comp_turn.space_playable? == false
          until @comp_turn.space_playable? == true
            @comp_turn.take_turn
            @comp_turn.assign_column(@comp_turn.player_input)
          end
        end
# Computer just places a piece instantly
        @board.add_o(@comp_turn.column_lowest, @comp_turn.column_header[@comp_turn.player_input])
        @board.print_board
# Rescan the win conditions after the computer turn
        @board.has_won_horizontally
        if @board.has_won_horizontally == true
          break
        end
        @board.has_won_vertically
        if @board.has_won_vertically == true
          break
        end
        @board.has_won_diagonally
          if @board.has_won_diagonally == true
            break
          end
        @board.has_won_diagonally_negative
          if @board.has_won_diagonally_negative == true
            break
          end
        @board.draw
        if @board.draw == true
          break
        end
    end
# Finally, restart the game after a win condition is met
    restart_game = Game.new
    restart_game.game_open
  end
end
