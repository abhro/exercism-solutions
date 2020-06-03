# frozen_string_literal: true

module PrimeFactors
  def self.of(number)
    factors = []
    return factors if number < 2

    while (number % 2).zero?
      factors << 2
      number /= 2
    end
    factor = 3
    while number > 1
      if (number % factor).zero?
        factors << factor
        number /= factor
      else
        factor += 2
      end
    end

    factors
  end
end
