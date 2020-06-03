class Series
  def initialize(str)
    @str = str
  end

  attr_reader :str

  def slices(length)
    raise ArgumentError, 'too big slice length' if length > str.length

    str.chars.each_cons(length).map(&:join)
  end
end
