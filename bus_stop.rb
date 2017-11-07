class BusStop
  attr_reader :bus_stop_name
  attr_accessor :queue

  def initialize(input_name)
    @bus_stop_name = input_name
    @queue = []
  end

  def add_person_to_queue(person)
    @queue.push(person)
  end

end
