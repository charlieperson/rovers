class Interface
  require_relative 'rovers_2'
  require_relative 'plateau'

  attr_reader :rover, :plateau

  def initialize
    set_plateau
    set_location
    set_directions
  end

  def set_plateau
    puts 'What is the top right most coordinate?'
    upper_right = gets.chomp.split(' ')
    @plateau = Plateau.new(upper_right)
  end

  def set_location
    puts 'Where is the rover currently?'
    start_point = gets.chomp.split(' ')
    @rover = Rover.new(plateau)
    @rover.heading = start_point[2]
    @rover.location = [start_point[0].to_i, start_point[1].to_i]
  end

  def set_directions
    puts 'Where would you like me to go?'
    @rover.directions = gets.chomp.split('')
  end
end
