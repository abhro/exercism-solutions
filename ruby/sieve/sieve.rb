# frozen_string_literal: true

#
# Implementation of the Sieve of Eratosthenes
#
class Sieve
  def initialize(limit)
    raise ArgumentError, "#{limit} is not a valid limit." if limit < 1

    @limit = limit
  end

  def primes
    primes = (2..@limit).to_a
    n = primes.length

    (0...n).each do |i|
      base = primes[i]
      next if base.nil?

      ((i + base)...n).step(base) { |j| primes[j] = nil }
    end

    primes.compact
  end

  def self.primes(limit)
    new(limit).primes
  end
end
