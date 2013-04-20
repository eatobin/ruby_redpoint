require_relative('./roster')
require_relative('./hat')
require_relative('./rules')

class RedpointRunner
  attr_reader(:blackhawks2010, :givee_hat, :year)

  def initialize
    @blackhawks2010 = Roster.new
    @year = 0
  end

  def puck_pass(giver, givee, year)
    @blackhawks2010.set_givee_code(giver, givee, year)
    @givee_hat.remove_puck(givee)
    nil
  end

  def puck_fail(givee)
    @givee_hat.discard_puck(givee)
    @givee_hat.draw_puck
  end

  def runner
    puts "Year #{@year} Gifts:"
    puts @blackhawks2010.giving_roster_report_string(0)
    puts
    print 'Continue? (1 = yes, 0 = no): '
    do_next_year = gets
    puts
    while do_next_year.to_i.eql?(1)
      @year = @year + 1
      @blackhawks2010.add_new_year
      @givee_hat = Hat.new(@blackhawks2010)
      giver_hat = Hat.new(@blackhawks2010)
      giver = giver_hat.draw_puck
      givee = @givee_hat.draw_puck
      until giver.nil?
        until givee.nil?
          if Rules.givee_not_self(giver, givee)
            if Rules.givee_not_recip(giver, givee, @blackhawks2010, @year)
              if Rules.givee_not_repeat(giver, givee, @blackhawks2010, @year)
                givee = self.puck_pass(giver, givee, @year)
              else
                givee = self.puck_fail(givee)
              end
            else
              givee = self.puck_fail(givee)
            end
          else
            givee = self.puck_fail(givee)
          end
        end
        giver_hat.remove_puck(giver)
        @givee_hat.return_discards
        giver = giver_hat.draw_puck
        givee = @givee_hat.draw_puck
      end
      puts "Year #{@year} Gifts:"
      puts @blackhawks2010.giving_roster_report_string(@year)
      puts
      print 'Continue? (1 = yes, 0 = no): '
      do_next_year = gets
      puts
    end
    puts 'This was fun!'
    puts 'Talk about a position with Redpoint?'
    puts 'Please call: Eric Tobin 773-325-1516'
    puts 'Thanks! Bye...'
  end
end

blackhawk_runner = RedpointRunner.new
blackhawk_runner.runner
