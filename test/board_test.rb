require './lib/board'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class BoardTest < Minitest::Test

  def test_it_exists
    board = Board.new
    require "pry"; binding.pry
    assert_instance_of Board, board
  end

  def test_cells_exists
    board = Board.new

    assert_equal board.cells, board.cells
  end

  def test_valid_coordinate?
    board = Board.new

    assert_equal true, board.valid_coordinate?("A1")
  end





end
