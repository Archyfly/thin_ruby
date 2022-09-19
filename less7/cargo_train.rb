require_relative 'train.rb'

class CargoTrain < Train

  @@ctinstances = 0

  def self.instances
    @@ctinstances
  end

  def initialize(number)
    @type = 'cargo'
    @@ctinstances += 1

    super
  end

  def attach_carriage
    @carriages << CargoCarriage.new
  end
end
