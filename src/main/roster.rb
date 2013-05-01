class Roster
  attr_reader(:roster_list)

  def initialize
    @roster_list = {
        :TroBro => Player.new('Troy Brouwer', :DavBol),
        :AdaBur => Player.new('Adam Burish', :DunKei),
        :AndLad => Player.new('Andrew Ladd', :JoeQue),
        :AntNie => Player.new('Antti Niemi', :JonToe),
        :BreSea => Player.new('Brent Seabrook', :KriVer),
        :BryBic => Player.new('Bryan Bickell', :MarHos),
        :BriCam => Player.new('Brian Campbell', :NikHja),
        :CriHue => Player.new('Cristobal Huet', :PatKan),
        :DavBol => Player.new('Dave Bolland', :PatSha),
        :DunKei => Player.new('Duncan Keith', :TomKop),
        :JoeQue => Player.new('Joel Quenneville', :TroBro),
        :JonToe => Player.new('Jonathan Toews', :AdaBur),
        :KriVer => Player.new('Kris Versteeg', :AndLad),
        :MarHos => Player.new('Marian Hossa', :AntNie),
        :NikHja => Player.new('Niklas Hjalmarsson', :BreSea),
        :PatKan => Player.new('Patrick Kane', :BryBic),
        :PatSha => Player.new('Patrick Sharp', :BriCam),
        :TomKop => Player.new('Tomas Kopecky', :CriHue)
    }
  end

  private
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

  public
  def return_player(player_code)
    @roster_list.fetch(player_code)
  end

  def set_givee_code(player_code, givee_code, year)
    self.return_player(player_code).set_givee_code(givee_code, year)
  end

  def return_givee_code(player_code, year)
    self.return_player(player_code).return_givee_code(year)
  end

  def add_new_year
    @roster_list.each_value do |player|
      player.add_givee_code(:none)
    end
  end

  def giving_roster_report_string(year)
    rr = String.new
    Hash[@roster_list.sort_by { |player_code| player_code }].each_value do |player|
      player_name = player.player_name
      givee_code = player.return_givee_code(year)
      if givee_code.eql?(:none)
        givee_name = '...nobody!! (last giver/givee pairing and a test failed - a puzzle logic error)'
      else
        givee_name = self.return_player(givee_code).player_name
      end
      rr << player_name + " is buying for " + givee_name + "\n"
    end
    rr
  end

  def print_and_ask(year)
    puts "Year #{year} Gifts:"
    puts self.giving_roster_report_string(year)
    puts
    print 'Continue? (1 = yes, 0 = no): '
    gets.chomp.to_i
  end
end
