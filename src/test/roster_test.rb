require_relative('../main/roster')
require 'test/unit'
require 'redgreen'

class RosterTest < Test::Unit::TestCase
  def test_get_player_name
    blackhawks2010 = Roster.new('../../blackhawks2010.txt')
    assert_equal(nil, blackhawks2010.get_player_name(:xxx))
    assert_equal('Adam Burish', blackhawks2010.get_player_name(:AdaBur))
  end

  def test_get_roled_player_code
    blackhawks2010 = Roster.new('../../blackhawks2010.txt')
    assert_equal(nil, blackhawks2010.get_roled_player_code(:xxx, 0, :givee))
    assert_equal(:DunKei, blackhawks2010.get_roled_player_code(:AdaBur, 0, :givee))
    assert_equal(:JonToe, blackhawks2010.get_roled_player_code(:AdaBur, 0, :giver))
  end

  def test_set_roled_player_code
    blackhawks2010 = Roster.new('../../blackhawks2010.txt')
    assert_equal(:DunKei, blackhawks2010.get_roled_player_code(:AdaBur, 0, :givee))
    assert_equal(:MarHos, blackhawks2010.set_roled_player_code(:AdaBur, :MarHos, 0, :givee))
    assert_equal(:MarHos, blackhawks2010.get_roled_player_code(:AdaBur, 0, :givee))
    assert_equal(:PatSha, blackhawks2010.set_roled_player_code(:AdaBur, :PatSha, 0, :giver))
    assert_equal(:PatSha, blackhawks2010.get_roled_player_code(:AdaBur, 0, :giver))
  end

  def test_add_new_year
    blackhawks2010 = Roster.new('../../blackhawks2010.txt')
    assert_equal(:DunKei, blackhawks2010.get_roled_player_code(:AdaBur, 0, :givee))
    blackhawks2010.add_new_year
    assert_equal(:none, blackhawks2010.get_roled_player_code(:AdaBur, 1, :givee))
    assert_equal(:none, blackhawks2010.get_roled_player_code(:PatSha, 1, :givee))
  end

  def test_print_giving_roster
    blackhawks2010 = Roster.new('../../blackhawks2010.txt')
    p(blackhawks2010.print_giving_roster(0))
  end
end
