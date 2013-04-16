require_relative('./roster')
require_relative('./hat')

class Rules
  def self.givee_not_self(giver_code, givee_code)
    !(giver_code == givee_code)
  end

  def self.givee_not_recip(giver_code, givee_code, roster, this_year)
    givee_giving_to = roster.return_givee_code(givee_code, this_year)
    !(giver_code == givee_giving_to)
  end

  def self.givee_not_repeat(giver_code, givee_code, roster, this_year)
    result = true
    counter = this_year - 1
    while (counter >= 0) && (counter >= (this_year - 4))
      givee_in_year = roster.return_givee_code(giver_code, counter)
      if givee_code == givee_in_year
        result = false
      end
      counter = counter - 1
    end
    result
  end
end
