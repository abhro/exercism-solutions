# frozen_string_literal: true

# add latin maybe?
class Say
  ONES = %w[zero one two three four five six seven eight nine].freeze

  # Contains names for 0..99 inclusive
  CARDINALS = ONES + %w[ten eleven twelve thirteen fourteen fifteen sixteen
                        seventeen eighteen nineteen] + (
    %w[twenty thirty forty fifty sixty seventy eighty ninety].map do |tens|
      [tens] + ONES[1...ONES.length].map { |unit| tens + '-' + unit }
    end).flatten
  CARDINALS.freeze

  HUNDRED = 'hundred'

  EXPONENTS = %w[one thousand million billion trillion].freeze

  def self.in_english(number)
    unless (0..999_999_999_999).include?(number)
      raise ArgumentError, "Number #{number} out of range"
    end
    return three_digit(number) if number < 1_000

    repr = []
    chunkify(number).each do |chunk|
      repr << chunk.magic
    end

    repr.join
  end

  def self.three_digit(number)
    raise ArgumentError unless (0..999).include?(number)

    return CARDINALS[number] if number < 100

    high_base = CARDINALS[number / 100] + ' ' + HUNDRED

    if (number % 100).zero?
      high_base
    else
      high_base + ' ' + CARDINALS[number]
    end
  end

  #
  # Returns numbers in 3 digit chunks, least significant digits first
  # 123_456_789 -> ['789', '456', '123']
  # 299_792_458 -> ['458', '792', '299']
  #
  # :return: Array
  #
  def self.chunkify(number)
    as_s = number.to_s.chars
    chunks = []
    unless (m = as_s.length % 3).zero?
      chunks << as_s.shift(m).join
    end
    as_s = as_s.join

    chunks << as_s.split(/(\d{3})/) unless as_s.empty?
    chunks.flatten!
    chunks.reverse!

    chunks.map(&:to_i)
  end
end
