class Rover

  attr_reader :plateau
  attr_accessor :location, :heading, :directions

  ORIENTATION= {'N' => [0, 1], 'E' => [1, 0], 'S' => [0, -1], 'W' => [-1, 0]}
  NESW = ['N', 'E', 'S', 'W']

  def initialize(plateau, start_point)
    @plateau = plateau
    @heading = start_point[2]
    @location = [start_point[0].to_i, start_point[1].to_i]
  end

  def navigate
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
      fallen?(location, plateau.upper_right)
    end
    return location.join(' ') + ' ' + heading
  end

  private

  def move(location, heading)
    location[0] += ORIENTATION[heading][0]
    location[1] += ORIENTATION[heading][1]
  end

  def turn_left(head)
    @heading = NESW[NESW.index(head) - 1]
  end

  def turn_right(head)
    @heading == 'W' ? @heading = 'N' : @heading = NESW[NESW.index(head) + 1]
  end

  def fallen?(location, upper_right)
    abort('You fell') if location[0] < 0 || location[0] > upper_right[0].to_i || location[1] < 0 || location[1] > upper_right[1].to_i
  end
end
