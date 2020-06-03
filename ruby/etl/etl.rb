# frozen_string_literal: true

module ETL
  def self.transform(old)
    transformed = {}
    old.each_pair do |score, letters|
      letters.each do |letter|
        transformed[letter.downcase] = score
      end
    end
    transformed
  end
end
