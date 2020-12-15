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
      puts "Your shot on #{shot} has destroyed my ship."
    elsif @cpu_board.cells[shot].ship_damage
      "H"
      puts "Your shot on #{shot} was a hit."
    else
       "."
    end
  end

  def player_shoot
    shot = gets.chomp.upcase
     if @cpu_board.valid_coordinate?(shot.strip) == true
       player_shot_logic(shot)
     else
       @message.invalid_shot
       player_shoot
    end
  end

  def cpu_shot
    shot2 = @player_board.cells.keys.sample(1).join
    if @player_board.valid_coordinate?(shot2) == true
      cpu_shot_logic(shot2)
    end
  end

  def cpu_shot_logic(shot2)
    @player_board.cells[shot2].fire_upon
     if @player_board.cells[shot2].shot_miss
      "M"
      puts "My shot on #{shot2} was a miss."
    elsif @player_board.cells[shot2].ship_destroyed
      "X"
       puts "My shot on #{shot} has destroyed your ship."
    elsif @player_board.cells[shot2].ship_damage
      "H"
      puts "My shot on #{shot2} was a hit."
    else
       "."
    end
  end

  def player_wins
    if @cpu_cruiser.sunk? && @cpu_submarine.sunk?
    @message.player_wins
   end
  end

  def cpu_wins
    if @player_cruiser.sunk? && @player_submarine.sunk?
     @message.computer_wins
    end
  end

  def turn
    @message.display_computer_board
    puts @cpu_board.render
    @message.display_player_board
    puts @player_board.render(true)
    @message.player_shot
    player_shoot
    player_wins
    @message.display_computer_board
    puts @cpu_board.render
    @message.display_player_board
    puts @player_board.render(true)
    cpu_shot
    cpu_wins
    turn

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
