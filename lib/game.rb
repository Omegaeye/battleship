require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game_message'

class Game

  attr_reader :player_board,
              :cpu_board,
              :player_ships,
              :cpu_cruiser,
              :cpu_sub,
              :cpu_ships,
              :message


  def initialize
     @player_board   = Board.new
     @cpu_board      = Board.new
     @player_cruiser = Ship.new("Cruiser", 3)
     @player_sub     = Ship.new("Submarine", 2)
     @cpu_cruiser    = Ship.new("Cruiser", 3)
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

  def place_cpu_ships
      cpu_random_coordinates(@cpu_cruiser)
      @cpu_board.place(@cpu_cruiser, cpu_random_coordinates(@cpu_cruiser))
      cpu_random_coordinates(@cpu_sub)
      @cpu_board.place(@cpu_sub, cpu_random_coordinates(@cpu_sub))
  end

  def player_place_cruiser
      puts @player_board.render(true)
      user_prompt = gets.chomp.upcase.split(" ")
    if @player_board.valid_placement?(@player_cruiser, user_prompt)
      @player_board.place(@player_cruiser, user_prompt)
    else
      @message.invalid_coordinates
      player_place_cruiser
    end
  end

  def player_place_sub
      puts @player_board.render(true)
      user_prompt = gets.chomp.upcase.split(" ")
    if @player_board.valid_placement?(@player_sub, user_prompt)
      @player_board.place(@player_sub, user_prompt)
      puts @player_board.render(true)
    else
      @message.invalid_coordinates
      player_place_sub
    end
  end

  def turn
    @message.display_player_board
    puts @cpu_board.render
    @message.display_computer_board
    puts @player_board.render(true)
    @message.player_shot
    gets.chomp.upcase
  end


  def start
    @message.welcome
      user_prompt = gets.chomp.downcase
    if user_prompt == "p"
        place_cpu_ships
        @message.computer_place_ships
        @message.user_place_ships
        @message.cruiser_coordinates
        player_place_cruiser
        @message.submarine_coordinates
        player_place_sub
        #turn
    elsif user_prompt == "q"
        @message.player_quits
        exit
    else
        @message.invalid_coordinates
    end
  end

end
