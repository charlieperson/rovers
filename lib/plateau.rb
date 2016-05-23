class Plateau
  attr_reader :upper_right

  def initialize(upper_right)
    @upper_right = upper_right
    @min_coordinates = [0, 0]
  end
end
