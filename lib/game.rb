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

  def player_shot_logic(shot)
    @cpu_board.cells[shot].fire_upon
     if @cpu_board.cells[shot].shot_miss
      "M"
      puts "Your shot on #{shot} was a miss."
    elsif @cpu_board.cells[shot].ship_destroyed
      "X"

    elsif @cpu_board.cells[shot].ship_damage
      "H"
      puts "Your shot on #{shot} was a hit."
    else
       "."
    end

  end

  def player_shoot
    shot = gets.chomp.upcase
    until @cpu_board.valid_coordinate?(shot) && @cpu_board.cells[shot].fired_upon? == false
      @message.invalid_shot
      player_shoot
    end
    player_shot_logic(shot)
  end

  def turn
    @message.display_computer_board
    puts @cpu_board.render
    @message.display_player_board
    puts @player_board.render(true)
    @message.player_shot
    player_shoot
    
    # computer_shoot #must be random_cells
    # @message.shot_fired_player #must tell what location was shot and if it is a Hit, Miss, or ship sunk
    # @message.shot_fired_computer  #must tell what location was shot and if it is a Hit, Miss, or ship sunk
    # @message.display_computer_board
    # puts @cpu_board.render
    # @message.display_player_board
    # puts @player_board.render(true)
    # #both boards must show updated info H, M,X with player board still showing ships
  end

#Winner once a someone wins the computer must recognise who won.
# if player wins @message.player_wins
#else compuer wins @message.computer_wins
#then return to @message.welcome

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
        turn
    elsif user_prompt == "q"
        @message.player_quits
        exit
    else
        @message.invalid_coordinates
    end
  end

end
