# frozen_string_literal: true

class Array
  def keep
    return self unless block_given?

    dup = []
    each { |elem| dup << elem if yield(elem) }
    dup
  end

  def discard
    return self unless block_given?

    dup = []
    each { |elem| dup << elem unless yield(elem) }
    dup
  end
end
