class Car
  attr_accessor :speed, :color  
  
end

class Truck < Car
  def initialize  
    super(&:color)
  end
end

