require_relative('../main/roster')
require_relative('../main/player')
require 'test/unit'

class RosterTest < Test::Unit::TestCase
  def test_roster
    my_roster = Roster.new
    my_roster.roster_list.clear
    my_roster.roster_list.store(:SarArt, Player.new('Sarah Artzi', :JerCoh))
    my_roster.roster_list.store(:EriTob, Player.new('Eric Tobin', :SarArt))
    my_roster.roster_list.store(:JerCoh, Player.new('Jerri Cohen', :EriTob))
    assert_equal('Eric Tobin', my_roster.roster_list.fetch(:EriTob).player_name)
    assert_equal(:JerCoh, my_roster.roster_list.fetch(:SarArt).past_givee_codes[0])
    assert_equal(3, my_roster.roster_list.length)
  end

  def test_return_player_name
    my_roster = Roster.new
    my_roster.roster_list.clear
    my_roster.roster_list.store(:SarArt, Player.new('Sarah Artzi', :JerCoh))
    my_roster.roster_list.store(:EriTob, Player.new('Eric Tobin', :SarArt))
    my_roster.roster_list.store(:JerCoh, Player.new('Jerri Cohen', :EriTob))
    assert_equal('Eric Tobin', my_roster.return_player_name(:EriTob))
    assert_equal('Jerri Cohen', my_roster.return_player_name(:JerCoh))
  end

  def test_return_givee
    my_roster = Roster.new
    my_roster.roster_list.clear
    my_roster.roster_list.store(:SarArt, Player.new('Sarah Artzi', :JerCoh))
    my_roster.roster_list.store(:EriTob, Player.new('Eric Tobin', :SarArt))
    my_roster.roster_list.store(:JerCoh, Player.new('Jerri Cohen', :EriTob))
    assert_equal(:SarArt, my_roster.return_givee_code(:EriTob, 0))
    assert_equal(:EriTob, my_roster.return_givee_code(:JerCoh, 0))
  end

  def test_set_givee
    my_roster = Roster.new
    my_roster.roster_list.clear
    my_roster.roster_list.store(:SarArt, Player.new('Sarah Artzi', :JerCoh))
    my_roster.roster_list.store(:EriTob, Player.new('Eric Tobin', :SarArt))
    my_roster.roster_list.store(:JerCoh, Player.new('Jerri Cohen', :EriTob))
    assert_equal(:SarArt, my_roster.return_givee_code(:EriTob, 0))
    assert_equal(:JerCoh, my_roster.set_givee_code(:EriTob, :JerCoh, 0))
    assert_equal(:JerCoh, my_roster.return_givee_code(:EriTob, 0))
  end

  def test_add_new_year
    my_roster = Roster.new
    my_roster.roster_list.clear
    my_roster.roster_list.store(:SarArt, Player.new('Sarah Artzi', :JerCoh))
    my_roster.roster_list.store(:EriTob, Player.new('Eric Tobin', :SarArt))
    my_roster.roster_list.store(:JerCoh, Player.new('Jerri Cohen', :EriTob))
    my_roster.add_new_year
    assert_equal(:JerCoh, my_roster.return_givee_code(:SarArt, 0))
    assert_equal(:none, my_roster.return_givee_code(:SarArt, 1))
  end

  def test_print_giving_roster
    my_roster = Roster.new
    my_roster.roster_list.clear
    my_roster.roster_list.store(:SarArt, Player.new('Sarah Artzi', :JerCoh))
    my_roster.roster_list.store(:EriTob, Player.new('Eric Tobin', :SarArt))
    my_roster.roster_list.store(:JerCoh, Player.new('Jerri Cohen', :EriTob))
    my_roster.print_giving_roster(0)
    my_roster = Roster.new
    puts
    puts my_roster.print_giving_roster(0)

  end
end
