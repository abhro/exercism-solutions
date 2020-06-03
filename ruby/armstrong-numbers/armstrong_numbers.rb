# frozen_string_literal: true

class ArmstrongNumbers
  def self.include?(number)
    n = number.dup
    digits = []

    while n.positive?
      digits.push(n % 10)
      n /= 10
    end

    exponent = digits.length
    digitsum = digits.map { |digit| digit**exponent }.sum

    number == digitsum
  end
end
