require './lib/board'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class BoardTest < Minitest::Test

  def test_it_exists
    board = Board.new
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

  def test_coordinates_equal_length
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      assert_equal false, board.coordinates_equal_length(cruiser, ["A1", "A2"])
      assert_equal false, board.coordinates_equal_length(submarine, ["A2", "A3", "A4"])
    end

    def test_all_numbers_alike
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      assert_equal false,  board.all_numbers_alike(["A1", "A2", "A4"])
      assert_equal true,  board.all_numbers_alike(["A1", "C1"])
      assert_equal false,  board.all_numbers_alike(["A3", "A2", "A1"])
    end

    def test_all_letters_alike
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      assert_equal true,  board.all_letters_alike(["A1", "A2", "A4"])
      assert_equal false,  board.all_letters_alike(["A1", "C1"])
      assert_equal true,  board.all_letters_alike(["A3", "A2", "A1"])
    end

    def test_horizontal?
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      assert_equal false,  board.horizontal?(["A1", "A2", "A4"])
      assert_equal false,  board.horizontal?(["A1", "C1"])
      assert_equal true,  board.horizontal?(["A1", "A2", "A3"])
      assert_equal false,  board.horizontal?(["B1", "C1", "D1"])
    end

    def vertical?
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      assert_equal false,  board.vertical?(["C1", "B1"])
      assert_equal true,   board.vertical?(["A1", "B1", "C1"])
      assert_equal true,  board.vertical?(["B1", "C1", "D1"])
    end

    def test_cell_empty
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      assert_equal true, board.cell_empty(["A1", "A2", "A4"])
    end

    def test_consecutive_placement
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      assert_equal false, board.consecutive_placement(["A1", "A2", "A4"])
      assert_equal true,  board.consecutive_placement(["B1", "C1", "D1"])
    end

    def test_valid_placement?
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
      assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
      assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
      assert_equal false, board.valid_placement?(submarine, ["A1", "C1"])
      assert_equal false, board.valid_placement?(cruiser, ["A3", "A2", "A1"])
      assert_equal false, board.valid_placement?(submarine, ["C1", "B1"])
      assert_equal false, board.valid_placement?(cruiser, ["A1", "B2", "C3"])
      assert_equal false, board.valid_placement?(submarine, ["C2", "D3"])
      assert_equal true,  board.valid_placement?(submarine, ["A1", "A2"])
      assert_equal true,  board.valid_placement?(cruiser, ["B1", "C1", "D1"])
    end
end
    def test_ship_placement?
      skip
       board = Board.new
       cruiser = Ship.new("Cruiser", 3)
       board.place(cruiser, ["A1", "A2", "A3"])
       cell_1 = board.cells["A1"]
       cell_2 = board.cells["A2"]
       cell_3 = board.cells["A3"]
       assert_equal cruiser, cell_1.ship
       assert_equal cruiser, cell_2.ship
       assert_equal cruiser, cell_3.ship
       assert_equal true, cell_3.ship == cell_2.ship
    end
