class Player
  attr_reader(:player_name)
  attr_accessor(:past_givees)

  def initialize(player_name, givee_year_zero)
    @player_name = player_name
    @past_givees = Array.new
    @past_givees << givee_year_zero
  end

  def add_givee(givee)
    @past_givees << givee
  end
end
