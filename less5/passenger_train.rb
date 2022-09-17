require_relative 'train.rb'

class PassengerTrain < Train
  @@ptinstances = 0

  def self.instances
    @@ptinstances
  end

  def initialize(number)
    @type = 'pass'
    @@ptinstances += 1

    super
  end

  def attach_carriage
    @carriages << PassengerCarriage.new
  end
end
