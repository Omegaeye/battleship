require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game_message'

class Game

  attr_reader :player_board,
              :cpu_board,
              :player_ships,
              :cpu_cruiser,
              :cpu_sub

  def initialize
    @player_board   = Board.new
    @cpu_board      = Board.new
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_sub     = Ship.new("Submarine", 2)
    @cpu_cruiser    = Ship.new("Cruiser", 3)
    @cpu_sub        = Ship.new("Submarine", 2)
  end

  def cpu_random_coord(ship)
    @cpu_board.cells.keys.sample(ship.length)
  end

  def cpu_random_coordinates(ship)
    random_cells = []
    until @cpu_board.valid_placement?(ship, random_cells) do
    random_cells = cpu_random_coord(ship)
    end
    random_cells
  end

  def place_cpu_ships(ship)
    rand_coord = cpu_random_coordinates(ship)
    @cpu_board.place(ship, rand_coord)
  end

  def cpu_ships_placement
      @cpu_board.place_cpu_ships(@cpu_cruiser)
      @cpu_board.place_cpu_ships(@cpu_sub)
  end

  def user_prompt
    gets.chomp.downcase
  end

  def player_place_ship
    #@gamemessage.user_place_ships
    user_enter_coord = user_prompt.split(" ").length == 3
      if user_enter_coord && @player_board.valid_coordinate?(ship, user_enter_coord)
          place_user_ship(cruiser, user_enter_coord)
      else
        #@gamemessage.invalid_coordinates
        player_place_ship
      end
  end

  def start
    #@gamemessage.welcome
    user_prompt
      if user_prompt == "p"
        cpu_ships_placement
        player_place_ship
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
