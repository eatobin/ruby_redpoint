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
        # p(@team_name)
        # p(@first_year)
        # p(@roster_list)
    rescue
      puts 'File Read error here!'
    end
  end

  class Player
    attr_reader(:player_name, :gift_history)

    def initialize(player_name, givee_code_year_zero, giver_code_year_zero)
      @player_name = player_name
      @gift_history = Array.new
      roles = Array.new
      givee = 0
      giver = 1
      roles[givee] = givee_code_year_zero
      roles[giver] = giver_code_year_zero
      @gift_history << roles
    end

    #   def add_givee_code(givee_code)
    #     @past_givee_codes << givee_code
    #   end
    #
    #   def return_givee_code(gift_year)
    #     @past_givee_codes.fetch(gift_year)
    #   end
    #
    #   def set_givee_code(givee_code, year)
    #     @past_givee_codes[year] = givee_code
    #   end
  end
  #
  # public
  # def return_player(player_code)
  #   @roster_list.fetch(player_code)
  # end
  #
  # def set_givee_code(player_code, givee_code, year)
  #   self.return_player(player_code).set_givee_code(givee_code, year)
  # end
  #
  # def return_givee_code(player_code, year)
  #   self.return_player(player_code).return_givee_code(year)
  # end
  #
  # def add_new_year
  #   @roster_list.each_value do |player|
  #     player.add_givee_code(:none)
  #   end
  # end
  #
  # def giving_roster_report_string(year)
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
