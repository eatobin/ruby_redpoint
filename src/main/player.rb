class Player
  attr_reader(:player_name, :past_givees)

  def initialize(player_name, givee_year_zero)
    @player_name = player_name
    @past_givees = Array.new
    @past_givees << givee_year_zero
  end

  def add_givee(givee)
    @past_givees << givee
  end

  def return_givee(gift_year)
    @past_givees[gift_year]
  end

  def set_givee(givee, year)
    @past_givees[year] = givee
  end
end
