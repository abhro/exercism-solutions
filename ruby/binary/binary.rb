module Binary

  def self.to_decimal(string)
    # any non binary digits get sent to the caller for punishment
    raise ArgumentError.new("bad binary string #{string}") if string =~ /[^01]/

    num = 0
    string.reverse.each_char.each_with_index do |digit, index|
      num += Integer(digit) * 2**index
    end

    num
  end
end
