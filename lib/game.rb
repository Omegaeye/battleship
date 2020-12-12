require './lib/ship'
require './lib/cell'
require './lib/board'
# require './lib/game_message'

class Game

  attr_reader :player_board,
              :cpu_board,
              :player_ships,
              :cpu_ships

  def initialize
    @player_board = Board.new
    @cpu_board = Board.new
    @player_ships = {"Cruiser" => Ship.new("Cruiser", 3),
                     "Submarine" => Ship.new("Submarine", 2)
    }
    @cpu_ships = {"Cruiser" => Ship.new("Cruiser", 3),
                     "Submarine" => Ship.new("Submarine", 2)
    }
  end

  def cpu_cruiser
    @coord_randomize = @computer_board.cells.keys.shuffle[0..2]
    @computer_board.place(@computer_ships["Cruiser"], @coord_randomize)
    
  end

  def cpu_ships_placement
    if valid_placement?(@computer_ships["Cruiser"], @coord_randomize)
     cpu_cruiser
    else

    # cpu_submarine
  end

  def user_prompt
    gets.chomp.downcase
  end

  def start
    #@gamemessage.intro
    user_prompt
      if user_prompt == "p"
        cpu_ships_placement
        #player place  ship
        #turn
      elsif user_prompt == "q"
        #@gamemessage.(You have quit the game)
        exit
      else
        #@gamemessage.(this is not a valid command)
        start
      end
  end




end











end
