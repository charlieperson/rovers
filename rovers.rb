puts 'What is the top right most coordinate?'
upper_right = gets.chomp.split(' ')
puts 'Where is the rover currently?'
start_point = gets.chomp.split(' ')
x = start_point[0].to_i
y = start_point[1].to_i
location = [x, y]
heading = start_point[2]
puts "Starting x position = " + x.to_s
puts "Starting y position = " + y.to_s
puts "Starting heading = " + heading

puts 'Where would you like me to go?'
directions = gets.chomp.split('')

orientation = {'N' => [0, 1], 'E' => [1, 0], 'S' => [0, -1], 'W' => [-1, 0]}
nesw = ['N', 'E', 'S', 'W']

def move(location, orientation, heading)
  location[0] += orientation[heading][0]
  location[1] += orientation[heading][1]
end

def turn_left(heading, nesw)
  heading = nesw[nesw.index(heading) - 1]
end

def turn_right(heading, nesw)
  heading == 'W' ? heading = 'N' : heading = nesw[nesw.index(heading) + 1]
end

def fallen?(location, upper_right)
  abort('You fell') if location[0] < 0 || location[0] > upper_right[0].to_i || location[1] < 0 || location[1] > upper_right[1].to_i
end

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

puts location.join(' ') + ' ' + heading
