require_relative('../main/player')

class Roster
  attr_reader (:roster_list)

  def initialize
    @roster_list = Hash.new
    @roster_list = {
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
        :TomKop => Player.new('Tomas Kopecky', :CriHue),
        :TroBro => Player.new('Troy Brouwer', :DavBol),
    }
  end

  def return_player_name(giver_code)
    @roster_list.fetch(giver_code).player_name
  end

  def return_givee_code(giver_code, year)
    @roster_list.fetch(giver_code).return_givee_code(year)
  end

  def set_givee_code(player_code, givee_code, year)
    @roster_list.fetch(player_code).set_givee_code(givee_code, year)
  end

  def add_new_year
    @roster_list.each_value do |player|
      player.add_givee_code(:none)
    end
  end

  def print_giving_roster(year)
    Hash[@roster_list.sort_by { |player_code| player_code }].each_value do |player|
      player_name = player.player_name
      givee_code = player.return_givee_code(year)
      if givee_code.eql?(:none)
        givee_name = '...nobody!! (last giver/givee pairing and a test failed - a puzzle logic error)'
      else
        givee_name = self.return_player_name(givee_code)
      end
      puts player_name + ' is buying for ' + givee_name
    end
  end
end
