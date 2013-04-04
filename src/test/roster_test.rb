require_relative('../main/roster')
require_relative('../main/player')
require 'test/unit'

class RosterTest < Test::Unit::TestCase
  def test_roster
    my_roster = Roster.new
    my_roster.roster_list.clear
    my_roster.roster_list.store(:SarArt, Player.new('Sarah Artzi', 'JerCoh'))
    my_roster.roster_list.store(:EriTob, Player.new('Eric Tobin', 'SarArt'))
    my_roster.roster_list.store(:JerCoh, Player.new('Jerri Cohen', 'EriTob'))
    assert_equal('Eric Tobin', my_roster.roster_list.fetch(:EriTob).player_name)
    assert_equal('JerCoh', my_roster.roster_list.fetch(:SarArt).past_givees[0])
    assert_equal(3, my_roster.roster_list.length)
  end

  #def test_add_givee
  #  my_player = Player.new('Eric Tobin', 'JerCoh')
  #  assert_equal(["JerCoh", "SarArt"], my_player.add_givee('SarArt'))
  #  assert_equal('SarArt', my_player.past_givees[1])
  #  assert_equal(["JerCoh", "SarArt", "ScoTob"], my_player.add_givee('ScoTob'))
  #  assert_equal('ScoTob', my_player.past_givees[2])
  #end
  #
  #def test_return_givee
  #  my_player = Player.new('Eric Tobin', 'JerCoh')
  #  my_player.add_givee('SarArt')
  #  my_player.add_givee('ScoTob')
  #  assert_equal('JerCoh', my_player.return_givee(0))
  #  assert_equal('ScoTob', my_player.return_givee(2))
  #end
  #
  #def test_set_givee
  #  my_player = Player.new('Eric Tobin', 'JerCoh')
  #  assert_equal('JerCoh', my_player.return_givee(0))
  #  assert_equal('SarArt', my_player.set_givee('SarArt', 0))
  #  assert_equal('SarArt', my_player.return_givee(0))
  #end
end
