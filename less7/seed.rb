module TestData
  def create_test_data

    @trains << train_pass_one = PassengerTrain.new(1)
    @trains << train_cargo_two = CargoTrain.new(2)
    @trains << train_cargo_three = CargoTrain.new(3)
    
    @stations << station_one = Station.new('talovka')
    @stations << station_two = Station.new('ivanovo')
    @stations << station_three = Station.new('reutovo')
    @stations << station_four = Station.new('novosib')
    @stations << station_five = Station.new('lesnaya')
    
    @routes << route_first = Route.new(station_one, station_three)
    @routes << route_second = Route.new(station_two, station_five)
    
    train_pass_one.train_by_route(route_first)

    train_cargo_two.train_by_route(route_second)
  end
end

