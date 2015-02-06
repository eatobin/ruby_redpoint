require_relative('../main/hat')
require_relative('../main/roster')
require 'test/unit'
require 'redgreen'

class HatTest < Test::Unit::TestCase
  def setup
    blackhawks2010 = Roster.new('../../blackhawks2010.txt')
    @giver_hat = Hat.new(blackhawks2010)
  end

  def test_hat
    p @giver_hat.pucks
    assert_equal(18, @giver_hat.pucks.length)
    p @giver_hat.discards
    assert_equal(0, @giver_hat.discards.length)
  end

  def test_draw_puck
    p @giver_hat.draw_puck
    assert_true(@giver_hat.pucks.include?(@giver_hat.draw_puck))
    @giver_hat.pucks.clear
    assert_nil(@giver_hat.draw_puck)
  end

  def test_remove_puck
    assert_true(@giver_hat.pucks.include?(:TroBro))
    assert_equal(:TroBro, @giver_hat.remove_puck(:TroBro))
    assert_false(@giver_hat.pucks.include?(:TroBro))
    assert_nil(@giver_hat.remove_puck(:TroBro))
  end

  def test_discard_puck
    assert_equal(18, @giver_hat.pucks.length)
    assert_true(@giver_hat.pucks.include?(:TroBro))
    assert_not_nil(@giver_hat.discard_puck(:TroBro))
    assert_true(@giver_hat.discards.include?(:TroBro))
    assert_equal(1, @giver_hat.discards_size)
    assert_equal(17, @giver_hat.pucks.length)

    assert_nil(@giver_hat.discard_puck(:TroBro))
    assert_equal(1, @giver_hat.discards_size)
    assert_equal(17, @giver_hat.pucks.length)
  end

  def test_return_discards
    assert_not_nil(@giver_hat.discard_puck(:TroBro))
    assert_not_nil(@giver_hat.discard_puck(:AntNie))
    assert_equal(2, @giver_hat.discards_size)
    assert_false(@giver_hat.pucks.include?(:AntNie))
    assert_equal([], @giver_hat.return_discards)
    assert_true(@giver_hat.pucks.include?(:AntNie))
    assert_equal(0, @giver_hat.discards_size)
    assert_nil(@giver_hat.return_discards)
  end
end
