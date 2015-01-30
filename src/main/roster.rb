class Roster
  attr_reader(:team_name, :first_year, :roster_list)

  def initialize(file_name)
    @roster_list = Hash.new
    begin
      f = File.open(file_name, 'r')
      f.each_line { |line|
        fields = line.split(',')
        if fields.length == 2
          @team_name = fields[0].strip
          @first_year = fields[1].strip
        else
          @roster_list[fields[0].strip.to_sym] = Player.new(fields[1].strip, fields[2].strip.to_sym, fields[3].strip.to_sym)
        end
      }
      f.close
    rescue
      puts 'File Read error here!'
    end
  end

  class Player
    attr_reader(:player_name, :gift_history)

    def initialize(player_name, givee_code_year_zero, giver_code_year_zero)
      @player_name = player_name
      @gift_history = Array.new
      roles = Hash.new
      roles[:givee] = givee_code_year_zero
      roles[:giver] = giver_code_year_zero
      @gift_history << roles
    end
  end

  def get_player(player_code)
    @roster_list.fetch(player_code, nil)
  end

  def get_player_name(player_code)
    if get_player(player_code).nil?
      nil
    else
      get_player(player_code).player_name
    end
  end

  def get_roled_player_code(player_code, gift_year, role)
    if get_player(player_code).nil?
      nil
    else
      get_player(player_code).gift_history[gift_year][role]
    end
  end

  def set_roled_player_code(player_code, setee_code, gift_year, role)
    if get_player(player_code).nil?
      nil
    else
      roles = get_player(player_code).gift_history[gift_year]
      roles[role] = setee_code
      get_player(player_code).gift_history[gift_year] = roles
      get_player(player_code).gift_history[gift_year][role]
    end
  end

  def add_new_year
    @roster_list.each_value do |player|
      player.gift_history << {:givee => :none, :giver => :none}
    end
  end

  def get_roster_list_codes
    @roster_list.keys
  end

  def print_giving_roster(gift_year)
    no_givee = Array.new
    no_giver = Array.new

    puts @team_name + ' - Year ' + (@first_year.to_i + gift_year).to_s + ' Gifts:'

    @roster_list.keys.sort.each do |player_code|
      player_name = get_player_name(player_code)
      givee_code = get_roled_player_code(player_code, gift_year, :givee)
      giver_code = get_roled_player_code(player_code, gift_year, :giver)

      if givee_code.equal?(:none)
        no_givee << player_code
      else
        puts player_name + ' is buying for ' + get_player_name(givee_code)
      end
      if giver_code.equal?(:none)
        no_giver << player_code
      end
    end

    unless no_givee.empty? && no_giver.empty?
      puts
      puts "There is a logic error in this year's pairings."
      puts 'Do you see it?'
      puts "If not... call me and I'll explain!"
      puts
      no_givee.each { |player_code| get_player(player_code) + ' is giving to no one.' }
      no_giver.each { |player_code| get_player(player_code) + ' is receiving from no one.' }
    end
  end

  # def giving_roster_report_string(gift_year)
  #   rr = String.new
  #   Hash[@roster_list.sort_by { |player_code| player_code }].each_value do |player|
  #     player_name = player.player_name
  #     givee_code = player.return_givee_code(year)
  #     if givee_code.eql?(:none)
  #       givee_name = '...nobody!! (last giver/givee pairing and a test failed - a puzzle logic error)'
  #     else
  #       givee_name = self.return_player(givee_code).player_name
  #     end
  #     rr << player_name + " is buying for " + givee_name + "\n"
  #   end
  #   rr
  # end
  #
  # def print_and_ask(year)
  #   puts "Year #{year} Gifts:"
  #   puts self.giving_roster_report_string(year)
  #   puts
  #   print 'Continue? (1 = yes, 0 = no): '
  #   gets.chomp.to_i
  # end
end
