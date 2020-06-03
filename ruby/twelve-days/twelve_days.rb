# frozen_string_literal: true

class TwelveDays
  ORDINALS = %w[first second third fourth fifth sixth
                seventh eighth ninth tenth eleventh twelfth].freeze
  RECEPTION =
    'On the %<nth_day>s day of Christmas my true love gave to me: %<presents>s.'

  GIFTS = [
    'a Partridge in a Pear Tree', 'two Turtle Doves', 'three French Hens',
    'four Calling Birds', 'five Gold Rings', 'six Geese-a-Laying',
    'seven Swans-a-Swimming', 'eight Maids-a-Milking', 'nine Ladies Dancing',
    'ten Lords-a-Leaping', 'eleven Pipers Piping', 'twelve Drummers Drumming'
  ].freeze

  def self.song(upto_day = 12)
    new(upto_day).song
  end

  def initialize(upto_day)
    @upto_day = upto_day
  end

  def song
    @upto_day.times.map { |day| verse(day) }.join("\n\n") + "\n"
  end

  def song_simpler
    IO.read(File.expand_path('song.txt', __dir__))
  end

  private

  #
  # Recite a single line about what your true love gave you on the nth day.
  #
  def verse(day)
    format(RECEPTION, nth_day: ORDINALS[day], presents: to_phrase(gifts(day)))
  end

  #
  # Return a presentable string on the presents for nth day
  #
  def to_phrase(items)
    *items, last_item = items
    return last_item if items.empty?

    items.join(', ') + ', and ' + last_item
  end

  def gifts(day)
    GIFTS.take(day + 1).reverse
  end
end
