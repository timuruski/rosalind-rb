require 'contest'
require 'rabbits'

class TestRabbits < Test::Unit::TestCase
  test "it works" do
    subject = Rabbits.new(3)
    pops = (1..6).map { |n| subject.pop(n) }
    assert_equal [1,1,4,7,19,40], pops
  end

  test "it is performant" do
    pop = Rabbits.new(3).pop(48)
    assert_equal 67780751622928960, pop
  end

  test "it works with variable litter sizes" do
    subject = Rabbits.new(5)
    pops = (1..6).map { |n| subject.pop(n) }
    assert_equal [1,1,6,11,41,96], pops
  end

end
