require_relative('../main/hat')
require_relative('../main/roster')
require_relative('../main/rules')
require 'test/unit'

class RulesTest < Test::Unit::TestCase
  def test_givee_not_self
    blackhawks2010 = Roster.new
    assert_false(Rules.givee_not_self(:PatSha, :PatSha))
    assert_true(Rules.givee_not_self(:PatSha, :AdaBur));
  end

  def test_givee_not_recip
    blackhawks2010 = Roster.new
    assert_true(Rules.givee_not_recip(:PatSha, :AdaBur, blackhawks2010, 0))
    assert_false(Rules.givee_not_recip(:BriCam, :PatSha, blackhawks2010, 0))
  end

  def test_givee_not_repeat
    blackhawks2010 = Roster.new
    blackhawks2010.add_new_year
    blackhawks2010.set_givee_code(:PatSha, :AdaBur, 1)
    assert_true(Rules.givee_not_repeat(:PatSha, :AdaBur, blackhawks2010, 1))
    assert_false(Rules.givee_not_repeat(:PatSha, :BriCam, blackhawks2010, 1))
    blackhawks2010.add_new_year
    blackhawks2010.set_givee_code(:PatSha, :AndLad, 2)
    blackhawks2010.add_new_year
    blackhawks2010.set_givee_code(:PatSha, :AntNie, 3)
    blackhawks2010.add_new_year
    blackhawks2010.set_givee_code(:PatSha, :BreSea, 4)
    blackhawks2010.add_new_year
    blackhawks2010.set_givee_code(:PatSha, :BryBic, 5)
    blackhawks2010.add_new_year
    blackhawks2010.set_givee_code(:PatSha, :BriCam, 6)
    assert_true(Rules.givee_not_repeat(:PatSha, :AdaBur, blackhawks2010, 6))
    assert_true(Rules.givee_not_repeat(:PatSha, :BriCam, blackhawks2010, 6))
    assert_false(Rules.givee_not_repeat(:PatSha, :AdaBur, blackhawks2010, 5))
    assert_true(Rules.givee_not_repeat(:PatSha, :BriCam, blackhawks2010, 5))
    assert_false(Rules.givee_not_repeat(:PatSha, :BriCam, blackhawks2010, 4))
    assert_false(Rules.givee_not_repeat(:PatSha, :BryBic, blackhawks2010, 6))
  end
end
