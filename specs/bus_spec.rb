require("minitest/autorun")
require("minitest/rg")
require_relative("../bus.rb")
require_relative("../person.rb")
require_relative("../bus_stop.rb")

class TestBus < MiniTest::Test
  def setup
    @bus = Bus.new(25, "Riccarton")
    @person_1 = Person.new('Malcolm', 38)
    @person_2 = Person.new('Phil', 30)
    @person_3 = Person.new('John Smith', 50)
    @bus_stop = BusStop.new("Dalry Road")
    @person_4 = Person.new('Charles', 65)
    @person_5 = Person.new('Chris', 18)
    @person_6 = Person.new('Diana', 45)
  end

  def test_get_route
    assert_equal(25, @bus.route)
  end

  def test_get_destination
    assert_equal("Riccarton", @bus.destination)
  end

  def test_drive
    assert_equal("brum brum", @bus.drive("brum brum"))
  end

  def test_passenger_number__empty
    assert_equal(0, @bus.passenger_number)
  end

  def test_passenger_number__one_passenger
     @bus.pick_up(@person_1)
    assert_equal(1, @bus.passenger_number)
  end

  def test_pick_up
    @bus.pick_up(@person_1)
    assert_equal("Malcolm", @bus.passengers[0].name)
  end

  def test_drop_off
    @bus.pick_up(@person_1)
    @bus.pick_up(@person_2)
    @bus.drop_off(@person_2)
    assert_equal([@person_1], @bus.passengers)
  end

  def test_empty_the_bus
    @bus.pick_up(@person_1)
    @bus.pick_up(@person_2)
    @bus.pick_up(@person_3)
    @bus.empty_the_bus
    assert_equal(0, @bus.passenger_number)
  end

  def test_pick_up_from_stop
    @bus.pick_up(@person_1)
    @bus.pick_up(@person_2)
    @bus.pick_up(@person_3)
    @bus_stop.add_person_to_queue(@person_4)
    @bus_stop.add_person_to_queue(@person_5)
    @bus_stop.add_person_to_queue(@person_6)
    on_bus_old = @bus.passenger_number
    in_queue_old = @bus_stop.queue.length
    @bus.pick_up_from_stop(@bus_stop)
    on_bus_new = @bus.passenger_number
    assert_equal(on_bus_old + in_queue_old, on_bus_new)
    assert_equal(0, @bus_stop.queue.length)
  end


end
