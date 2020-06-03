# frozen_string_literal: true

require 'set'

class SumOfMultiples
  def initialize(*factors)
    @factors = factors
  end

  def to(limit)
    multiples = Set.new
    @factors.each do |factor|
      next if factor.zero?

      multiple = factor
      while multiple < limit
        multiples << multiple
        multiple += factor
      end
    end

    multiples.sum
  end
end
