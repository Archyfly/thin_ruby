class Train

  attr_accessor :speed, :carriage, :current_station, :prev_station, :next_station
  attr_reader :number, :type, :route

  def initialize(number, type, carriage)
    @number = number
    @type = type
    @speed = 0
    @carriage = []

  end

  # общий метод для класса Train и потомков
  def speed_up(value)
    @speed += value
  end
  # общий метод для класса Train и потомков
  def speed_down
    @speed = 0
  end

  # общий метод  для класса Train и потомков
  def train_by_route(route)
    @route = route
    self.route.first_station.add_train(self)
    @current_station_index = 0
  end

  # общий метод для класса Train и потомков
  def current_station
    route.stations[@current_station_index]
  end

  # общий метод для класса Train и потомков
  def next_station
    @next_station = route.stations[@current_station_index+1]
  end

  # общий метод для класса Train и потомков
  def prev_station
    @prev_station = route.stations[@current_station_index-1]
  end

  # общий метод для класса Train и потомков
  def move_forward
    current_station.delete_train(self)
    next_station.add_train(self)
    @current_station_index += 1
  end

  # общий метод для класса Train и потомков
  def move_back
    current_station.delete_train(self)
    prev_station.add_train(self)
    @current_station_index -= 1
  end

  # общий метод нужна корректировка
  def attach_carriage
    @carriage += 1 if self.speed == 0
  end

  # общий метод нужна корректировка
  def detach_carriage
    @carriage -= 1
  end
end
