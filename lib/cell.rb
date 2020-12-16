class Cell
attr_reader :coordinate,
            :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship       = nil
    @fired_upon = false
  end

  def empty?
    @ship.nil?
  end

  def place_ship(cruiser)
    @ship = cruiser
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if @ship != nil
      @ship.hit
      @fired_upon = true
     end
    @fired_upon = true
  end

  def shot_miss
    fired_upon? && empty?
  end

  def ship_destroyed
    fired_upon? && @ship.sunk?
  end

  def ship_damage
    fired_upon? && !empty?
  end

  def render(user = false)
    if !fired_upon? && !empty? && user == true
      "S"
    elsif shot_miss
      "M"
    elsif ship_destroyed
      "X"
    elsif ship_damage
      "H"
    else !fired_upon?
       "."
    end
  end
end
