class Interface
  require_relative 'rovers_2'

  attr_reader :rover

  def initialize(rover = Rover.new)
    @rover = rover
    set_plateau
    set_location
    set_directions
  end

  def set_plateau
    puts 'What is the top right most coordinate?'
    @rover.upper_right = gets.chomp.split(' ')
  end

  def set_location
    puts 'Where is the rover currently?'
    start_point = gets.chomp.split(' ')
    @rover.heading = start_point[2]
    @rover.location = [start_point[0].to_i, start_point[1].to_i]
  end

  def set_directions
    puts 'Where would you like me to go?'
    @rover.directions = gets.chomp.split('')
  end
end
