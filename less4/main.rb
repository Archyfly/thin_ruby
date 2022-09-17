require './train.rb'
require './route.rb'
require './station.rb'

class MainMenu
  attr_reader :stations, :trains, :routes

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def create_test_data

    @trains << train_pass_one = Train.new(1, 'pass', 6)
    @trains << train_cargo_two = Train.new(2, 'cargo', 10)
    @trains << train_cargo_three = Train.new(3, 'cargo', 20)

    @stations << station_one = Station.new('talovka')
    @stations << station_two = Station.new('ivanovo')
    @stations << station_three = Station.new('reutovo')
    @stations << station_four = Station.new('novosib')
    @stations << station_five = Station.new('lesnaya')

    @routes << route_first = Route.new(station_one, station_three)
    @routes << route_second = Route.new(station_two, station_five)

    train_pass_one.train_by_route(route_first)
    train_cargo_three.train_by_route(route_first)

    train_cargo_two.train_by_route(route_second)
  end

  def all_trains
    @trains.each {|train| puts "Train number #{train.number}, type: #{train.type}, number of carriage: #{train.carriage}"}
  end

  def all_stations
    @stations.each {|station| puts "Station: #{station.name}, #{station.trains} "}
  end

  def all_routes
    @routes.each {|route| puts "Route: first station #{route.first_station.name}, last station: #{route.last_station.name} "}
  end


end

m = MainMenu.new
m.create_test_data
puts "Trains created:"
m.all_trains
puts "Stations created:"
m.all_stations
puts "Routes added"
m.all_routes
