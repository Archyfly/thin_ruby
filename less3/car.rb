class Car
  def initialize(speed, engine_volume)
    @speed = speed
    @engine_volume = engine_volume
  end

  def start_engine
    puts "Wroom!"
  end

  def beep
    puts "Beep beep"
  end

  def stop
    @speed = 0
  end

  def go
    @speed = 50
  end

  def current_speed
    @speed
  end

  def engine_volume
    @engine_volume
  end

  def set_speed(speed)
    @speed = speed
  end


end
