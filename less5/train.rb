class Train
  @@tinstances = 0

  attr_accessor :speed, :carriages, :current_station, :prev_station, :next_station
  attr_reader :number, :type, :route

  def self.instances
    @@tinstances
  end

  def initialize(number)
    @number = number
    @type = type
    @speed = 0
    @carriages = []
    @@tinstances += 1
  end

  def speed_up(value)
    @speed += value
  end

  def speed_down
    @speed = 0
  end

  def attach_carriage
    @carriages << Carriage.new
  end

  def detach_carriage
    @carriages.pop
  end

  def train_by_route(route)
    @route = route
    self.route.first_station.add_train(self)
    @current_station_index = 0
  end

  def current_station
    route.stations[@current_station_index]
  end

  def next_station
    @next_station = route.stations[@current_station_index+1]
  end

  def prev_station
    @prev_station = route.stations[@current_station_index-1]
  end

  def move_forward
    current_station.delete_train(self)
    next_station.add_train(self)
    @current_station_index += 1
  end

  def move_back
    current_station.delete_train(self)
    prev_station.add_train(self)
    @current_station_index -= 1
  end

end
