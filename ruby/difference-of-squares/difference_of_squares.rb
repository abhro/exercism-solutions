class Squares
  module Squarable
    refine Integer do
      def square
        self * self
      end
    end
  end
  using Squarable

  def initialize(number)
    @number = number
  end

  attr_reader :number

  def difference
    square_of_sum - sum_of_squares
  end

  def square_of_sum
    (number * (number + 1) / 2).square
  end

  def sum_of_squares
    (1..number).map(&:square).sum
  end
end
