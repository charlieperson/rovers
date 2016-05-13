class Rover

  attr_reader :bikes, :capacity, :broken_bikes

  def initialize(capcity = DEFAULT_CAPACITY)
    @orientation = {'N' => [0, 1], 'E' => [1, 0], 'S' => [0, -1], 'W' => [-1, 0]}
    @nesw = ['N', 'E', 'S', 'W']

    @bikes = []
    @broken_bikes = []
    @capacity = capcity
  end

  def release_bike
    raise("Can't release bike: None available or broken") if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    raise("Docking station is full") if dock_is_full?
    @bikes << bike
  end

  def dock_broken_bike(bike)
    raise("Docking station is full") if dock_is_full?
    bike.report_broken
    @broken_bikes << bike
  end

  def collect_broken_bikes
    give_bikes = broken_bikes.map{|bike| bike}
    @broken_bikes.clear
    return give_bikes
  end

  def receive_working_bikes(bikes)
    bikes.each do |bike|
      @bikes << bike
    end
  end

  private

  def dock_is_full?
    bikes.length + broken_bikes.length >= DEFAULT_CAPACITY
  end

end
