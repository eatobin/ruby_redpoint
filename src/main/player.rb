class Player
  attr_reader(:player_name, :past_givee_codes)

  def initialize(player_name, givee_code_year_zero)
    @player_name = player_name
    @past_givee_codes = Array.new
    @past_givee_codes << givee_code_year_zero
  end

  def add_givee_code(givee_code)
    @past_givee_codes << givee_code
  end

  def return_givee_code(gift_year)
    @past_givee_codes.fetch(gift_year)
  end

  def set_givee_code(givee_code, year)
    @past_givee_codes[year] = givee_code
  end
end
