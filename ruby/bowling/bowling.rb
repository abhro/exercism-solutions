# frozen_string_literal: true

#
# Represent a game of tenpin bowling
#
class Game
  class BowlingError < Exception; end

  def initialize
    @rolls = []
  end

  def score
    # TODO: validation

    @rolls.sum
  end

  def roll(pins)
    raise BowlingError unless pins >= 0

    @rolls << pins
  end
end
