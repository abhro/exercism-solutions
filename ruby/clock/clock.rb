# frozen_string_literal: true

class Clock
  def initialize(hour: 0, minute: 0)
    @total_minutes = (hour * 60 + minute) % (24 * 60)
  end

  def hour
    total_minutes / 60
  end

  def minute
    total_minutes % 60
  end

  def to_s
    format '%02i:%02i', hour, minute
  end

  def inspect
    "#<#{self.class.name}: #{self}>"
  end

  attr_reader :total_minutes

  def ==(other)
    total_minutes == other.total_minutes
  end

  def +(other)
    Clock.new(minute: total_minutes + other.total_minutes)
  end

  def -(other)
    Clock.new(minute: total_minutes - other.total_minutes)
  end
end
