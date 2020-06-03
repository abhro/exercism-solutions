# frozen_string_literal: true

class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  attr_reader :phrase

  def word_count
    phrase.downcase.scan(/\b[\w']+\b/)
          .each_with_object(Hash.new(0)) { |word, counter| counter[word] += 1 }
  end
end
