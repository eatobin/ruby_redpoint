require_relative('../main/roster')
require 'test/unit'
require 'redgreen'

class RosterTest < Test::Unit::TestCase
  def setup
    @blackhawks2010 = Roster.new('../../blackhawks2010.txt')
  end

  def test_get_player_name
    assert_equal(nil, @blackhawks2010.get_player_name(:xxx))
    assert_equal('Adam Burish', @blackhawks2010.get_player_name(:AdaBur))
  end

  def test_get_givee_code
    assert_equal(nil, @blackhawks2010.get_givee_code(:xxx, 0))
    assert_equal(:DunKei, @blackhawks2010.get_givee_code(:AdaBur, 0))
  end

  def test_get_giver_code
    assert_equal(nil, @blackhawks2010.get_giver_code(:xxx, 0))
    assert_equal(:JonToe, @blackhawks2010.get_giver_code(:AdaBur, 0))
  end

  def test_set_givee_code
    assert_equal(:DunKei, @blackhawks2010.get_givee_code(:AdaBur, 0))
    assert_equal(:MarHos, @blackhawks2010.set_givee_code(:AdaBur, :MarHos, 0))
    assert_equal(:MarHos, @blackhawks2010.get_givee_code(:AdaBur, 0))
  end

  def test_set_giver_code
    assert_equal(:JonToe, @blackhawks2010.get_giver_code(:AdaBur, 0))
    assert_equal(:PatSha, @blackhawks2010.set_giver_code(:AdaBur, :PatSha, 0))
    assert_equal(:PatSha, @blackhawks2010.get_giver_code(:AdaBur, 0))
  end

  def test_add_new_year
    assert_equal(:DunKei, @blackhawks2010.get_givee_code(:AdaBur, 0))
    @blackhawks2010.add_new_year
    assert_equal(:none, @blackhawks2010.get_givee_code(:AdaBur, 1))
    assert_equal(:none, @blackhawks2010.get_givee_code(:PatSha, 1))
  end

  def test_print_giving_roster
    @blackhawks2010.print_giving_roster(0)

    # introduce an error and see if the method chokes on it
    @blackhawks2010.set_givee_code(:AdaBur, :anAwfullyBadPlayerCode, 0);
    puts
    puts 'Check out who Adam Burish is giving to!:'
    puts
    @blackhawks2010.print_giving_roster(0)

    # go to a short roster to see logic errors
    puts
    roster = Roster.new('../../empty2014.txt')
    roster.print_giving_roster(0)
  end
end
