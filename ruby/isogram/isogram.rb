# frozen_string_literal: true

module Isogram
  def self.isogram?(phrase)
    phrase = phrase.downcase.scan(/[a-z]/)
    phrase.uniq.length == phrase.length
  end
end
