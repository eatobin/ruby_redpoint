require_relative('./roster')

class Hat
  attr_reader(:pucks, :discards)

  def initialize(roster)
    @pucks = Array.new(roster.roster_list.keys)
    @discards = Array.new
  end

  def draw_puck
    @pucks.sample
  end

  def remove_puck(player_code)
    @pucks.delete(player_code)
  end

  def discards_size
    @discards.length
  end
end
