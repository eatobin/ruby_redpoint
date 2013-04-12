require_relative('../main/roster')
require 'test/unit'

class RosterTest < Test::Unit::TestCase
  def test_return_givee
    blackhawks2010 = Roster.new
    assert_equal(:DunKei, blackhawks2010.return_givee_code(:AdaBur, 0))
    assert_equal(:BriCam, blackhawks2010.return_givee_code(:PatSha, 0))
  end

  def test_set_givee
    blackhawks2010 = Roster.new
    assert_equal(:DunKei, blackhawks2010.return_givee_code(:AdaBur, 0))
    assert_equal(:MarHos, blackhawks2010.set_givee_code(:AdaBur, :MarHos, 0))
    assert_equal(:MarHos, blackhawks2010.return_givee_code(:AdaBur, 0))
  end

  def test_add_new_year
    blackhawks2010 = Roster.new
    blackhawks2010.add_new_year
    assert_equal(:DunKei, blackhawks2010.return_givee_code(:AdaBur, 0))
    assert_equal(:none, blackhawks2010.return_givee_code(:AdaBur, 1))
    assert_equal(:none, blackhawks2010.return_givee_code(:PatSha, 1))
  end

  def test_print_giving_roster
    blackhawks2010 = Roster.new
    puts blackhawks2010.giving_roster_report_string(0)
  end
end
