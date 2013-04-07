require_relative('../main/player')
require 'test/unit'

class PlayerTest < Test::Unit::TestCase
  def test_player
    my_player = Player.new('Eric Tobin', :JerCoh)
    assert_equal('Eric Tobin', my_player.player_name)
    assert_equal(:JerCoh, my_player.past_givee_codes[0])
  end

  def test_add_givee_code
    my_player = Player.new('Eric Tobin', :JerCoh)
    assert_equal([:JerCoh, :SarArt], my_player.add_givee_code(:SarArt))
    assert_equal(:SarArt, my_player.past_givee_codes[1])
    assert_equal([:JerCoh, :SarArt, :ScoTob], my_player.add_givee_code(:ScoTob))
    assert_equal(:ScoTob, my_player.past_givee_codes[2])
  end

  def test_return_givee_code
    my_player = Player.new('Eric Tobin', :ScoTob)
    my_player.add_givee_code(:SarArt)
    my_player.add_givee_code(:ScoTob)
    assert_equal(:ScoTob, my_player.return_givee_code(0))
    assert_equal(:ScoTob, my_player.return_givee_code(2))
  end

  def test_set_givee_code
    my_player = Player.new('Eric Tobin', :ScoTob)
    assert_equal(:ScoTob, my_player.return_givee_code(0))
    assert_equal(:SarArt, my_player.set_givee_code(:SarArt, 0))
    assert_equal(:SarArt, my_player.return_givee_code(0))
  end
end
