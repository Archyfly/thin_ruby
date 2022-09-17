class Route
  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  def first_station
    @stations.first
  end

  def last_station
    @stations.last
  end

  def find_station_by(name)
    @stations.each do |station|
      if name == station.name
        return station
      end
    end
  end

  def station_add(station, position)
    @stations.insert(position-1, station)
  end

  def station_remove(station)
    @stations.delete(station)
  end

end

