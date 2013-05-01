require_relative('./roster')
require_relative('./hat')
require_relative('./rules')

class Redpoint
  attr_reader(:year, :blackhawks2010, :giver_hat, :givee_hat, :giver, :givee)

  def initialize
    @year = 0
    @blackhawks2010 = Roster.new
  end

  def runner
    while @blackhawks2010.print_and_ask(@year).eql?(1)

      self.start_new_year

      until @giver.nil?

        until @givee.nil?

          if Rules.givee_not_self(@giver, @givee)
            if Rules.givee_not_recip(@giver, @givee, @blackhawks2010, @year)
              if Rules.givee_not_repeat(@giver, @givee, @blackhawks2010, @year)
                @givee = self.givee_is_success
              else
                @givee = self.givee_is_failure
              end
            else
              @givee = self.givee_is_failure
            end
          else
            @givee = self.givee_is_failure
          end

        end

        self.select_new_giver

      end

      puts

    end

    puts
    puts 'This was fun!'
    puts 'Talk about a position with Redpoint?'
    puts 'Please call: Eric Tobin 773-325-1516'
    puts 'Thanks! Bye...'
  end

  def start_new_year
    @year = @year + 1
    @blackhawks2010.add_new_year
    @givee_hat = Hat.new(@blackhawks2010)
    @giver_hat = Hat.new(@blackhawks2010)
    @giver = @giver_hat.draw_puck
    @givee = @givee_hat.draw_puck
  end

  def select_new_giver
    @giver_hat.remove_puck(@giver)
    @givee_hat.return_discards
    @giver = giver_hat.draw_puck
    @givee = @givee_hat.draw_puck
  end

  def givee_is_success
    @blackhawks2010.set_givee_code(@giver, @givee, @year)
    @givee_hat.remove_puck(@givee)
    nil
  end

  def givee_is_failure
    @givee_hat.discard_puck(@givee)
    @givee_hat.draw_puck
  end
end

blackhawk_runner = Redpoint.new
blackhawk_runner.runner
