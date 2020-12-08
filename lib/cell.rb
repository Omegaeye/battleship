class Cell
attr_reader :coordinate,
            :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship       = nil

  end

  def empty?
    @ship.nil?
  end

  def place_ship(cruiser)
    @ship = cruiser
  end

  def fired_upon?
    if @ship.health < @ship.length
      true
    else
      false
    end
  end

  def fired_upon
    if @ship != empty?
      @ship.hit
    end
  end

end
