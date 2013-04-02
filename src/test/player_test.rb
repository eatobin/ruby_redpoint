require_relative('../main/player')
require 'test/unit'

class PlayerTest < Test::Unit::TestCase
  def test_player
    my_player = Player.new('Eric Tobin', 'JerCoh')
    assert_equal('Eric Tobin', my_player.player_name)
    assert_equal('JerCoh', my_player.past_givees[0])
  end

  def test_add_givee
    my_player = Player.new('Eric Tobin', 'JerCoh')
    assert_equal(["JerCoh", "SarArt"],my_player.add_givee('SarArt'))
    assert_equal('SarArt', my_player.past_givees[1])
    assert_equal(["JerCoh", "SarArt", "ScoTob"], my_player.add_givee('ScoTob'))
    assert_equal('ScoTob', my_player.past_givees[2])
  end

  def test_return_givee
    my_player = Player.new('Eric Tobin', 'JerCoh')
    my_player.add_givee('SarArt')
    my_player.add_givee('ScoTob')
    assert_equal('JerCoh', my_player.return_givee(0))
    assert_equal('ScoTob', my_player.return_givee(2))
  end
end
