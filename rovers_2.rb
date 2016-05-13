class Rover

  attr_accessor :location, :heading, :directions, :upper_right

  $orientation = {'N' => [0, 1], 'E' => [1, 0], 'S' => [0, -1], 'W' => [-1, 0]}
  $nesw = ['N', 'E', 'S', 'W']

  def initialize(plateau)
    @upper_right = plateau.upper_right
  end

  def find_my_rover
    directions.each do |d|
      if d == 'M'
        move(location, heading)
      elsif d == 'L'
        turn_left(heading)
      elsif d == 'R'
        turn_right(heading)
      else
        abort('Not valid directions.')
      end
      fallen?(location, upper_right)
    end
    return location.join(' ') + ' ' + heading
  end

  private

  def move(location, heading)
    location[0] += $orientation[heading][0]
    location[1] += $orientation[heading][1]
  end

  def turn_left(head)
    @heading = $nesw[$nesw.index(head) - 1]
  end

  def turn_right(head)
    @heading == 'W' ? @heading = 'N' : @heading = $nesw[$nesw.index(head) + 1]
  end

  def fallen?(location, upper_right)
    abort('You fell') if location[0] < 0 || location[0] > upper_right[0].to_i || location[1] < 0 || location[1] > upper_right[1].to_i
  end
end
