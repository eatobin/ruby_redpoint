require_relative('../main/hat')
require_relative('../main/roster')
require_relative('../main/rules')
require 'test/unit'

class RulesTest < Test::Unit::TestCase
  def test_givee_not_repeat
    blackhawks2010 = Roster.new
    blackhawks2010.add_new_year
    blackhawks2010.set_givee_code(:PatSha, :AdaBur, 1)
    assert_true(Rules.givee_not_repeat(:PatSha, :AdaBur, blackhawks2010, 1))
    assert_false(Rules.givee_not_repeat(:PatSha, :BriCam, blackhawks2010, 1))
  end
end
