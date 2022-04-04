require './lib/board'
require './lib/player'
require './lib/turn'

class Game

attr_reader :human_player, :comp_player, :board, :human_turn, :comp_turn, :column_header

  def initialize
    @human_player = Player.new(:human)
    @comp_player = Player.new(:computer)
    @board = Board.new
    @human_turn = Turn.new(human_player.type, @board)
    @comp_turn = Turn.new(comp_player.type, @board)
# Added a new hash that assigns player_input values to the Column position of the full_board array
# When calling add_x or add_o, the playable piece will be assigned it's lowest row position, relative to the column header
    @column_header = {
      "A" => 0,
      "B" => 1,
      "C" => 2,
      "D" => 3,
      "E" => 4,
      "F" => 5,
      "G" => 6
    }
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
# At first, we select a Column Header assignment
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
          @board.add_x(@player_turn.column_lowest, @player_turn.column_header[@player_tun.player_input])
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
        if @comp_turn.space_playable? == false
          until @comp_turn.space_playable? == true
            @comp_turn.take_turn
            @comp_turn.assign_column(@comp_turn.player_input)
          end
        end
        @comp_turn.add_o(@comp_turn.column_lowest, @comp_turn.column_header[@comp_turn.player_input])
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
  end

end
