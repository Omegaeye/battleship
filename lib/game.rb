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
    @cpu_ships =    {"Cruiser" => Ship.new("Cruiser", 3),
                   "Submarine" => Ship.new("Submarine", 2)
    }
  end
  def cpu_random_coord
    @cpu_board.cells.keys.shuffle[0..2]
  end
  def cpu_cruiser_place
    @cpu_board.place(@cpu_ships["Cruiser"], cpu_random_coord)
  end

  def cpu_cruiser_placement
    cpu_random_coord
    if @cpu_board.valid_placement?(@cpu_ships["Cruiser"], cpu_random_coord)
      cpu_cruiser_place
    else
      cpu_cruiser_placement
    end
  end
  #
  def cpu_ships_placement
    cpu_cruiser_placement
    cpu_submarine_placement
  end
  #
  def user_prompt
    gets.chomp.downcase
  end

  def start
    #@gamemessage.welcome
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
