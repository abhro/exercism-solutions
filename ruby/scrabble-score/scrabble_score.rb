# frozen_string_literal: true

class Scrabble
  def initialize(word)
    @word = word
  end

  SCORE_TABLE = {
    'a' => 1, 'e' => 1, 'i' => 1, 'o' => 1, 'u' => 1, 'l' => 1,
    'n' => 1, 'r' => 1, 's' => 1, 't' => 1, 'd' => 2, 'g' => 2,
    'b' => 3, 'c' => 3, 'm' => 3, 'p' => 3, 'f' => 4, 'h' => 4,
    'v' => 4, 'w' => 4, 'y' => 4, 'k' => 5, 'j' => 8, 'x' => 8,
    'q' => 10, 'z' => 10
  }.freeze

  attr_reader :word

  def score
    return 0 if word.nil?

    tiles.sum { |c| SCORE_TABLE[c] }
  end

  def self.score(word)
    new(word).score
  end

  private

  #
  # Return tiles as an array of scrabble characters
  #
  def tiles
    word.downcase.scan(/[a-z]/)
  end
end
