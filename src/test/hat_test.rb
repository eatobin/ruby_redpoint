require_relative('../main/hat')
require_relative('../main/roster')
require 'test/unit'

class HatTest < Test::Unit::TestCase
  def test_hat
    giver_hat = Hat.new(Roster.new)
    p giver_hat.pucks
    assert_equal(18, giver_hat.pucks.length)
    p giver_hat.discards
    assert_equal(0, giver_hat.discards.length)
  end

  def test_draw_puck
    giver_hat = Hat.new(Roster.new)
    p giver_hat.draw_puck
    assert_true(giver_hat.pucks.include?(giver_hat.draw_puck))
    giver_hat.pucks.clear
    assert_nil(giver_hat.draw_puck)
  end
end
