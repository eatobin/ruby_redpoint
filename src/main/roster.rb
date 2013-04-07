require_relative('../main/player')

class Roster
  attr_reader (:roster_list)

  def initialize
    @roster_list = Hash.new
    @roster_list = {:AdaBur => Player.new('Adam Burish', 'DunKei'),
                    :AndLad => Player.new('Andrew Ladd', 'JoeQue'),
                    :AntNie => Player.new('Antti Niemi', 'JonToe'),
                    :BreSea => Player.new('Brent Seabrook', 'KriVer'),
                    :BryBic => Player.new('Bryan Bickell', 'MarHos'),
                    :BriCam => Player.new('Brian Campbell', 'NikHja'),
                    :CriHue => Player.new('Cristobal Huet', 'PatKan'),
                    :DavBol => Player.new('Dave Bolland', 'PatSha'),
                    :DunKei => Player.new('Duncan Keith', 'TomKop'),
                    :JoeQue => Player.new('Joel Quenneville', 'TroBro'),
                    :JonToe => Player.new('Jonathan Toews', 'AdaBur'),
                    :KriVer => Player.new('Kris Versteeg', 'AndLad'),
                    :MarHos => Player.new('Marian Hossa', 'AntNie'),
                    :NikHja => Player.new('Niklas Hjalmarsson', 'BreSea'),
                    :PatKan => Player.new('Patrick Kane', 'BryBic'),
                    :PatSha => Player.new('Patrick Sharp', 'BriCam'),
                    :TomKop => Player.new('Tomas Kopecky', 'CriHue'),
                    :TroBro => Player.new('Troy Brouwer', 'DavBol'),
    }
  end

  def return_player_name(player_code)
    @roster_list.fetch(player_code).player_name
  end

  def return_givee(player_code, year)
    @roster_list.fetch(player_code).return_givee(year)
  end
end
