# frozen_string_literal: true

module Prime
  def self.nth(n)
    raise ArgumentError, 'Prime index must be a natural number' if n < 1

    case n
    when 1 then 2
    when 2 then 3
    when 3 then 5
    when 4 then 7
    when 5 then 11
    else
      i = 5
      candidate = 11
      while i < n
        candidate += 2
        i += 1 if prime?(candidate)
      end

      candidate
    end
  end

  def self.prime?(n)
    return n > 1 if n <= 3
    return false if n.even? || (n % 3).zero?

    i = 5
    while i * i <= n
      return false if (n % i).zero? || (n % (i + 2)).zero?

      i += 6
    end

    true
  end
end
