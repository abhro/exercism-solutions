# frozen_string_literal: true

module Raindrops
  refine Integer do
    def divisible?(divisor)
      modulo(divisor).zero?
    end
  end

  using Raindrops

  SUBS = { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong' }.freeze

  def self.convert(number)
    format = SUBS.map { |divisor, sub| sub if number.divisible? divisor }.join

    return format unless format.empty?

    number.to_s
  end
end
