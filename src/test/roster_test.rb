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

  def test_return_player_name
    my_roster = Roster.new
    my_roster.roster_list.clear
    my_roster.roster_list.store(:SarArt, Player.new('Sarah Artzi', 'JerCoh'))
    my_roster.roster_list.store(:EriTob, Player.new('Eric Tobin', 'SarArt'))
    my_roster.roster_list.store(:JerCoh, Player.new('Jerri Cohen', 'EriTob'))
    assert_equal('Eric Tobin', my_roster.return_player_name(:EriTob))
    assert_equal('Jerri Cohen', my_roster.return_player_name(:JerCoh))
  end

  def test_return_givee
    my_roster = Roster.new
    my_roster.roster_list.clear
    my_roster.roster_list.store(:SarArt, Player.new('Sarah Artzi', 'JerCoh'))
    my_roster.roster_list.store(:EriTob, Player.new('Eric Tobin', 'SarArt'))
    my_roster.roster_list.store(:JerCoh, Player.new('Jerri Cohen', 'EriTob'))
    assert_equal('SarArt', my_roster.return_givee(:EriTob, 0))
    assert_equal('EriTob', my_roster.return_givee(:JerCoh, 0))
  end
end
