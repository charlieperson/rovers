class Rover

  attr_reader :directions, :upper_right, :nesw, :orientation
  attr_accessor :location, :heading

  def initialize
    @orientation = {'N' => [0, 1], 'E' => [1, 0], 'S' => [0, -1], 'W' => [-1, 0]}
    @nesw = ['N', 'E', 'S', 'W']
    puts 'What is the top right most coordinate?'
    @upper_right = gets.chomp.split(' ')
    puts 'Where is the rover currently?'
    @start_point = gets.chomp.split(' ')
    @heading = @start_point[2]
    @location = [@start_point[0].to_i, @start_point[1].to_i]
    puts 'Where would you like me to go?'
    @directions = gets.chomp.split('')
  end

  def find_my_rover
    directions.each do |d|
      if d == 'M'
        location[0] += orientation[heading][0]
        location[1] += orientation[heading][1]
        puts location.to_s
      elsif d == 'L'
        heading = nesw[nesw.index(heading) - 1]
        puts 'heading: ' + heading
      elsif d == 'R'
        heading == 'W' ? heading = 'N' : heading = nesw[nesw.index(heading) + 1]
        puts 'heading: ' + heading
      else
        abort('Not valid directions.')
      end
      fallen?(location, upper_right)
    end
    return location.join(' ') + ' ' + heading
  end

  private

  def fallen?(location, upper_right)
    abort('You fell') if location[0] < 0 || location[0] > upper_right[0].to_i || location[1] < 0 || location[1] > upper_right[1].to_i
  end
end
