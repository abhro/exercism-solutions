# frozen_string_literal: true

class Luhn
  def self.valid?(numstr)
    new(numstr).valid?
  end

  def initialize(numstr)
    @numstr = numstr
  end

  def valid?
    @numstr = @numstr.delete(' ')
    return false if too_short? || non_digit_present?

    checksum.modulo(10).zero?
  end

  private

  def checksum
    # double every second digit from the right with 0 <= product <= 9
    each_digit_pair.sum do |first, second|
      first.to_i + double(second.to_i)
    end
  end

  def double(num)
    product = num * 2
    product > 9 ? product - 9 : product
  end

  def each_digit_pair
    @numstr.scan(/\d/).reverse.each_slice(2)
  end

  def too_short?
    @numstr.length == 1
  end

  def non_digit_present?
    @numstr.match?(/[^0-9]/)
  end
end
