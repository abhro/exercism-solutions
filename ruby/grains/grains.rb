# frozen_string_literal: true

module Grains
  def self.square(square)
    unless (1..64).include?(square)
      raise ArgumentError, 'Square must be between 1 and 64'
    end

    2**(square - 1)
  end

  def self.total
    (0...64).sum { |x| 2**x }
  end
end
