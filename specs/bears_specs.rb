require("minitest/autorun")
require("minitest/rg")

require_relative("../bears")
require_relative("../river")
require_relative("../fish")

class BearTest < MiniTest::Test

  def setup
    @bear = Bear.new("Yogi", "Grizzly")
  end

  def test_bear_has_name
    assert_equal("Yogi", @bear.name)
  end

  def test_bear_has_type
    assert_equal("Grizzly", @bear.type)
  end

  def test_bear_has_no_fish_in_stomach()
    assert_equal(0, @bear.stomach_count())
  end

  def test_bear_has_fish_in_stomach
    @bear.eat_up(@fish1)
    assert_equal(1, @bear.stomach_count)
  end

  def test_bear_has_all_fish_in_stomach
    @bear.eat_up(@fish1)
    @bear.eat_up(@fish1)
    @bear.eat_up(@fish1)
    assert_equal(3, @bear.stomach_count)
  end

  def test_bear_can_roar
    assert_equal("Roar!", @bear.bear_can_roar("Roar!"))
  end

  def test_add_fish_to_bear_remove_from_river
    @bear.eat_up(@fish1)
    assert_equal(1, @bear.stomach_count)
    @river.remove_fish(@fish1)
    assert_equal(0, @river.fish_count)
  end

end
