# frozen_string_literal: true

class Array
  def accumulate
    return self unless block_given?

    dup = []
    each { |elem| dup << yield(elem) }
    dup
  end
end
