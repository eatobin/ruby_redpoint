require_relative('./roster')
require_relative('./hat')
require_relative('./rules')

class RedpointRunner
  year = 0
  blackhawks2010 = Roster.new

  puts "Year #{year} Gifts:"
  puts blackhawks2010.giving_roster_report_string(0)
end
