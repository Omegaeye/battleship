require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
# require './lib/game_message'
require './lib/game'

class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new
    assert_instance_of Game, game
  end

  def test_cpu_cruiser
    game = Game.new
    cpu_board = Board.new
    cpu_ships = {"Cruiser" => Ship.new("Cruiser", 3),
                 "Submarine" => Ship.new("Submarine", 2)}

  end

end
