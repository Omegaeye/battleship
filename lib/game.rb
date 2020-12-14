require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game_message'

class Game

  attr_reader :player_board,
              :cpu_board,
              :player_ships,
              :cpu_ships,
              :message

  def initialize
    @player_board   = Board.new
    @cpu_board      = Board.new
    @player_cruiser = Ship.new("Cruiser", 3),
    @player_sub     = Ship.new("Submarine", 2)
    @cpu_cruiser    = Ship.new("Cruiser", 3),
    @cpu_sub        = Ship.new("Submarine", 2)
    @message        = Messages.new
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
      cpu_cruiser_placement
      cpu_submarine_placement
  end

  def user_prompt
    gets.chomp.downcase
  end


  def start
    @message.welcome
      user_prompt
      if user_prompt == "p"
        cpu_ships_placement
          @message.computer_place_ships
          @message.user_place_ships
          @player_board.render(true)
          @message.cruiser_coordinates
          #player place cruiser
          p @player_board.render(true)
          @message.submarine_coordinates
          #player place submarine
          @message.display_computer_board
          p @cpu_board.render
          @message.display_player_board
          p @player_board.render(true)
        #turn
      elsif user_prompt == "q"
        @message.quit
        exit
      else
        @message.invalid_coordinates
    end
  end

end
