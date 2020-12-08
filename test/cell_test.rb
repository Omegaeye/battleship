require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test

  def test_it_exist
    cell = Cell.new("B4")
    assert_instance_of Cell, cell
  end

  def test_it_has_attributes
    cell = Cell.new("B4")
    assert_equal "B4", cell.coordinate
  end

  def test_ship_exists
    cell = Cell.new("B4")
    assert_nil nil,  cell.ship
  end

  def test_empty?
    cell = Cell.new("B4")
    assert_equal true, cell.empty?
  end

  def test_place_ship
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    assert_equal cruiser, cell.ship

    assert_equal false, cell.empty?
  end

  def test_fired_upon?
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    assert_equal false, cell.fired_upon?
  end

  def test_fire_upon
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    assert_equal false, cell.fired_upon?
    cell.fired_upon
    assert_equal 2, cell.ship.health
    assert_equal true, cell.fired_upon?
  end

  def test_render
    cruiser = Ship.new("Cruiser", 3)
    cell_1 = Cell.new("B4")
    cell_1.place_ship(cruiser)
    assert_equal ".", cell_1.render

    cell_1.fired_upon
    assert_equal  2, cell_1.ship.health
    assert_equal "M", cell_1.render
  end
end
