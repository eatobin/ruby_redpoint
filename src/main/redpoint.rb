require_relative('./roster')
require_relative('./hat')
require_relative('./rules')

class Redpoint
  attr_reader(:year, :roster, :giver_hat, :givee_hat, :giver, :givee)

  def initialize
    @year = 0
    @roster = Roster.new('../../blackhawks2010.txt')
  end

  def runner
    # puts print_and_ask(@year).downcase.eql?('q')
    until print_and_ask(@year).downcase.eql?('q')
      self.start_new_year
      until @giver.nil?
        until @givee.nil?
          if Rules.givee_not_self(@giver, @givee) &&
              Rules.givee_not_recip(@giver, @givee, @roster, @year) &&
              Rules.givee_not_repeat(@giver, @givee, @roster, @year)
            givee_is_success
          else
            givee_is_failure
          end


          # if Rules.givee_not_self(@giver, @givee)
          #   if Rules.givee_not_recip(@giver, @givee, @roster, @year)
          #     if Rules.givee_not_repeat(@giver, @givee, @roster, @year)
          #       @givee = self.givee_is_success
          #     else
          #       @givee = self.givee_is_failure
          #     end
          #   else
          #     @givee = self.givee_is_failure
          #   end
          # else
          #   @givee = self.givee_is_failure
          # end
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
    @roster.add_new_year
    @givee_hat = Hat.new(@roster)
    @giver_hat = Hat.new(@roster)
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
    @roster.set_givee_code(@giver, @givee, @year)
    @roster.set_giver_code(@givee, @giver, @year)
    @givee_hat.remove_puck(@givee)
    nil
  end

  def givee_is_failure
    @givee_hat.discard_puck(@givee)
    @givee_hat.draw_puck
  end

  def print_and_ask(year)
    @roster.print_giving_roster(year)
    puts
    print("Continue? ('q' to quit): ")
    gets.chomp
  end
end
