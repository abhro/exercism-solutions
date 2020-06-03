module Pangram
  def self.pangram? phrase
    phrase.downcase!
    ('a'..'z').each do |letter|
      return false if !phrase.include?(letter)
    end
    true
  end
end
