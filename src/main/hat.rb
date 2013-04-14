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

  def discard_puck(player_code)
    if @pucks.delete(player_code)
      @discards.push(player_code)
    end
  end

  def return_discards
    if self.discards_size > 0
      @pucks.concat(@discards)
      @discards.clear
    end
  end
end
