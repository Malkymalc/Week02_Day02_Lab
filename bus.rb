class Bus
  attr_reader :route, :destination, :passengers

  def initialize(input_route, input_destination)
    @route = input_route
    @destination = input_destination
    @passengers = []
  end

  def drive(driving)
    return driving
  end

  def passenger_number
    @passengers.length
  end

  def pick_up(person)
    @passengers.unshift(person)
  end

  def drop_off(person)
    @passengers.delete(person)
  end

  def empty_the_bus
    @passengers = []
  end

  def pick_up_from_stop(bus_stop)
    for person in bus_stop.queue
      pick_up(person)
    end
    bus_stop.queue = []
  end
end
