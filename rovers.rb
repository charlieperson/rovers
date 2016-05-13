puts 'What is the top right most coordinate?'
upper_right = gets.chomp
puts 'Where is the rover currently?'
starting_location = gets.chomp
start_x = starting_location.split(' ')[0].to_i
start_y = starting_location.split(' ')[1].to_i
start_point = [start_x, start_y]
direction = starting_location.split(' ')[2]
puts "Starting x position = " + start_x.to_s
puts "Starting y position = " + start_y.to_s
puts "Starting direction = " + direction

puts 'Where would you like me to go?'
directions = gets.chomp.split('')
puts directions
orientation = {'N' => [0, 1], 'E' => [1, 0], 'S' => [0, -1], 'W' => [-1, 0]}

nesw = ['N', 'E', 'S', 'W']

directions.each do |d|
  if d == 'M'
    start_point[0] += orientation[direction][0]
    start_point[1] += orientation[direction][1]
    puts start_point.to_s
  elsif d == 'L'
    direction = nesw[nesw.index(direction) - 1]
    puts 'direction: ' + direction
  elsif d == 'R'
    direction = nesw[nesw.index(direction) + 1]
    puts 'direction: ' + direction
  end
end
