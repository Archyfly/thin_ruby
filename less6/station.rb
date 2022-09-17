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
end
