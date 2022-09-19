require_relative './route.rb'
require_relative './station.rb'
require_relative './passenger_train.rb'
require_relative './passenger_carriage.rb'
require_relative './cargo_train.rb'
require_relative './cargo_carriage.rb'
require_relative './seed.rb'

class MainMenu
  include TestData
  attr_reader :stations, :trains, :routes

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def all_trains
    @trains.each {|train| puts "Поезд номер: #{train.number}, Тип поезда: #{train.type}, Количество вагонов: #{train.carriages.count}"}
  end

  def all_stations
    @stations.each do |station| 
      puts "Станция: #{station.name}"
      station.trains.each {|train| puts "Поезд #{train.number}, #{train.type}, #{train.carriages}" }
    end  
  end

  def all_routes
    @routes.each {|route| puts "Route: first station #{route.first_station.name}, last station: #{route.last_station.name} "}
  end

  def create_station
    puts "Введите название станции:"
    name = gets.chomp
    if @stations.find {|station| station.name == name}
      puts "Станция с названием #{name} уже существует. Введите другое название:"
      create_station
    else
      @new_station = Station.new(name)
    end

    if @new_station.valid?
      @stations << @new_station
      puts "Станция создана"
    else
      puts "Название станции некоректно, попробуйте еще раз"
      create_station
    end

    
    user_choice
  end

  def create_train
      puts "Введите тип поезда: pass - пассажирский, cargo - грузовой"
      type = gets.chomp
      puts "Присвойте номер создаваемому поезду (формат xxxxx или xxx-xx ):"
      number = gets.chomp
      puts "Укажите компанию - производителя поезда:"
      man_name = gets.chomp
      if @trains.find {|train| train.number == number}
        puts "Поезд с номером #{number} уже существует. Присвойте другой номер:"
        create_train
      elsif
        if type == 'pass'
          train = PassengerTrain.new(number)
        elsif type == 'cargo'
          train = CargoTrain.new(number)
        end
      end

    if train.valid?
      train.manufacturer = man_name
      @trains << train
      puts "Поезд создан успешно. Введенные данные корректны"
    else
      puts "Данные некорректны, попробуйте еще раз."
      create_train
    end

    user_choice
  end

  def find_station(name)
    @stations.find {|station| station.name == name}
  end

  def create_route
    all_stations
    puts "Выберите первую станцию маршрута:"
    name_first = gets.chomp
    puts "Выберите последнюю станцию маршрута:"
    name_last = gets.chomp
    @routes << new_route = Route.new(find_station(name_first), find_station(name_last))
    puts "Просмотреть маршрут - 1"
    puts "Добавить станцию - 2"
    puts "Удалить станцию - 3"
    puts "Создать еще один маршрут - 4"
    puts "Выйти в предыдущее меню - 0 или Enter"
    loop do
      route_menu = gets.chomp.to_i
      case route_menu
        when 1
          puts ("Маршрут #{new_route.first_station.name} - #{new_route.last_station.name}")
        when 2
          # добавить станцию
          all_stations
          puts "Введите название станции:"
          station = gets.chomp
          st = find_station(station)
          new_route.station_add(st, -2)
          puts "Станция добавлена"
          puts new_route
        when 3
          # удалить станцию
        when 4
         create_route
      end
      break if route_menu == 0
    end
  end

  def find_route
    @routes.each_with_index do |route, index|
      puts("Маршрут № #{index+1} : #{route.first_station.name} - #{route.last_station.name}")
    end
  end

  def find_train_by_number(number)
    @trains.find {|train| train.number == number}
  end

  def train_to_route
    all_trains
    puts "Введите номер поезда для добавления на маршрут:"
    number = gets.chomp.to_i
    train_to_add = find_train_by_number(number)
    puts "Выбран поезд № #{train_to_add.number}, тип: #{train_to_add.type}, количество вагонов: #{train_to_add.carriages.count}"
    find_route
    puts "Введите номер маршрута:"
    number_route = gets.chomp.to_i
    route_to_add = @routes[number_route-1]
    train_to_add.train_by_route(route_to_add)
    puts train_to_add
  end

  def add_carriage_to_train
    all_trains
    puts "Введите номер поезда для прицепления вагона:"
    number = gets.chomp.to_i
    train_to_add_carriage = find_train_by_number(number)
    train_to_add_carriage.attach_carriage
  end

  def remove_carriage_from_train
    all_trains
    puts "Введите номер поезда для отцепления вагона:"
    number = gets.chomp.to_i
    train_to_add_carriage = find_train_by_number(number)
    if train_to_add_carriage.carriages.count > 0
      train_to_add_carriage.detach_carriage
      puts "Вагон отцеплен. Количество оставшихся вагонов: #{train_to_add_carriage.carriages.count}"
    else
      puts "У поезда № #{number} нет вагонов."
    end
  end

  def move_train_menu
    all_trains
    puts "Введите номер поезда для перемещения:"
    number = gets.chomp.to_i
    train_to_move = find_train_by_number(number)
    puts "Куда вы хотите переместить поезд? 1 - Вперёд, 2 - Назад"
    move_to = gets.chomp.to_i
    case move_to
    when 1
      train_to_move.move_forward
    when 2
      train_to_move.move_back
    end
  end

  def view_stations_on_route
    @routes.each do |route|
      puts route
      route.stations.each {|station| print"#{station.name} \n"  }
    end
  end

    def intro
    puts "Вас приветствует программа управления железной дорогой."
    user_choice  
  end  
    
  def user_choice
    loop do
    puts "Выберите действие:"
    puts "1 - Создать станцию"
    puts "2 - Создать поезд"
    puts "3 - Создавать маршрут и управлять станциями в нем (добавлять, удалять)"
    puts "4 - Назначать маршрут поезду"
    puts "5 - Добавлять вагоны к поезду"
    puts "6 - Отцеплять вагоны от поезда"
    puts "7 - Перемещать поезд по маршруту вперед и назад"
    puts "8 - Просматривать список станций и список поездов на станции"
    puts "09 - Просмотреть все поезда"
    puts "010 - Просмотреть все станции у маршрута"
    puts "011 - Загрузить тестовые данные (3 поезда, 5 станций, 2 маршрута)"

    input =  gets.chomp
    
    case input
    # Создавать станции - ok
      when '1'
        create_station

    # Создавать поезда - ok
      when '2'
        create_train

    # Создавать маршрут и управлять станциями в нем (добавлять, удалять) - ok
      when '3'
        create_route

    # Назначать маршрут поезду - ok
      when '4'
        train_to_route    

    # Добавлять вагоны к поезду - ok
      when '5'
        add_carriage_to_train
    # Отцеплять вагоны от поезда - ok
      when '6'
        remove_carriage_from_train
    # Перемещать поезд по маршруту вперед и назад
      when '7'
        move_train_menu
    # Просматривать список станций и список поездов на станции
      when '8' 
        all_stations 
    # Просматривать все поезда
      when '09'
        all_trains
      # Просматривать все станции маршрута
      when '010'
        view_stations_on_route
      when '011'
        self.create_test_data
      end
    break if input == "stop" 
  end
  end
end

m = MainMenu.new
m.intro

