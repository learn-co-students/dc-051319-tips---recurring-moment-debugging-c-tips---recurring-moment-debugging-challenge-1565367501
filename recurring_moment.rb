require 'active_support'
require 'active_support/core_ext'
require 'pry'

class RecurringMoment

  attr_accessor :start, :interval, :period

  def initialize(start:, interval:, period:)
    @start = start
    @interval = interval
    @period = period
  end

  def match(date)
    current = @start

    while current < Time.now
      if current == date
        return true
      end
      binding.pry
      if @period == 'monthly'
        current = current.advance(months: @interval)
      elsif @period == 'weekly'
        current = current.advance(weeks: @interval)
      elsif @period == 'daily'
        current = current.advance(days: @interval)
      end
    end

    return false
  end
end
