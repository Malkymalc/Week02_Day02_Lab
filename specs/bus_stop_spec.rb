require("minitest/autorun")
require("minitest/rg")
require_relative("../bus_stop.rb")
require_relative("../person.rb")
require_relative('../bus.rb')

class TestBusStop < MiniTest::Test
  def setup
    @bus_stop = BusStop.new("Dalry Road")
    @person_4 = Person.new('Charles', 65)
    @person_5 = Person.new('Chris', 18)
    @person_6 = Person.new('Diana', 45)
  end

  def test_get_bus_stop_name
    assert_equal("Dalry Road", @bus_stop.bus_stop_name)
  end

  def test_add_person_to_queue
    @bus_stop.add_person_to_queue(@person_4)
    @bus_stop.add_person_to_queue(@person_5)
    @bus_stop.add_person_to_queue(@person_6)
    assert_equal(3,@bus_stop.queue.length)
  end


end
