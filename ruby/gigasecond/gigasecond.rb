module Gigasecond
  def self.from(timestamp)
    timestamp + 1_000_000_000
  end
end
