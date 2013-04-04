require_relative('../main/player')

class Roster
  attr_reader(:roster_list)

  def initialize
    @roster_list = Hash.new
    @roster_list = {:SarArt => Player.new('Sarah Artzi', 'JerCoh'),
                    :EriTob => Player.new('Eric TobinZZ', 'SarArt'),
                    :JerCoh => Player.new('Jerri Cohen', 'EriTob')
    }
  end
end
