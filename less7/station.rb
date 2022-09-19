require './instance_counter.rb'

class Station
include InstanceCounter

  @@stations = []
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self

    register_instances
  end

  def valid?
    validate!
    true # возвращаем true, если метод validate! не выбросил исключение
  rescue
    false # возвращаем false, если было исключение
  end

  def add_train(train)
    @trains << train
  end

  def delete_train(train)
    @trains.delete(train) if @trains.include?(train)
  end

  def trains_by_type(type)
    @trains.filter { |train| train.type == type}
  end

  class << self

    def all
      @@stations
    end

  end

  protected

  def validate!
    raise "Необходимо ввести название станции!" if @name == ''

    true
  end
end
