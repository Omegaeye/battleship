require './lib/ship'
require './lib/cell'
require './lib/board'


class Messages

  def welcome
    puts "*** Now Entering BATTLESHIP.***\n Enter p to play. Enter q to quit"
  end

  def player_quits
    puts "You have quit the game. Goodbye"
  end
  def computer_place_ships
    puts "I have laid out my ships on the the battlefield."
  end


  def user_place_ships
    puts "You now need to lay out your two ships.\n The Cruiser is three units long.\n The Submarine is two units long"
  end

  def cruiser_coordinates
    puts "Enter the squares for Cruiser (3 spaces):"
  end

  # def display_board_with_cruiser
  # end

  def submarine_coordinates
    puts "Enter the squares for Submarine (2 spaces):"
  end

  def invalid_coordinates
    puts "Those are invlaid coordinates on the battlefield. Please try again:"
  end

  def display_computer_board
    puts "========= Computer Board ========="
  end

   def display_player_board #(render= true)
    puts "========= Player Board ========="
  end

  def player_shot
    puts "Enter the coordinate for your shot."
    print ">"
  end

  def invalid_shot
    puts "That is an invalid shot. Try Again:"
    print ">"
  end

  #computer shoots, must be random and cannot repeat

  def shot_fired_player
    puts "Your shot on #{@cpu_board.player_shoot} was a #{[]} "
  end

  def shot_fired_computer
    puts "My shot on #{[]} was a #{[]}"
  end

  def player_wins
    puts "You have emerged VICTORIOUS!"
  end

  def computer_wins
    puts "You may have lost the battle but the war is not over."
  end



end
