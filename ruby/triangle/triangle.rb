class Triangle
  def initialize sides
    @first, @second, @third = sides
  end

  def equilateral?
    ![@first, @second, @third].include?(0) &&
      @first == @second && @second == @third
  end

  def isosceles?
    ![@first, @second, @third].include?(0) &&
      (@first + @second > @third && @second + @third > @first && @first + @third > @second) &&
      (@first == @second || @first == @third || @second == @third)
  end

  def scalene?
    ![@first, @second, @third].include?(0) &&
      (@first + @second > @third && @second + @third > @first && @first + @third > @second) &&
      (@first != @second && @second != @third && @first != @third)
  end
end
