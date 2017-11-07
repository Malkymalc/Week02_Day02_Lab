require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../person.rb')

class TestPerson < MiniTest::Test
  def setup
    @person_1 = Person.new('Phil', 21)
  end

  def test_get_name
    assert_equal('Phil', @person_1.name)
  end

  def test_get_age
    assert_equal(21, @person_1.age)
  end

end
