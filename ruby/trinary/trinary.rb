class Trinary
  def initialize(trinary_repr)
    @trinary_repr = trinary_repr
  end

  def to_decimal
    # invalid trinary strings default to 0
    return 0 if @trinary_repr.match?(/[^012]/)

    @trinary_repr.reverse.each_char.each_with_index.map do |digit, index|
      Integer(digit) * 3**index
    end.sum
  end
end
