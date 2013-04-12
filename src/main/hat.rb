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
end
