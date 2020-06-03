# frozen_string_literal: true

class RunLengthEncoding
  def self.encode(unencoded)
    return '' if unencoded.empty?

    encoded = []
    current = unencoded[0]
    count = 0
    unencoded.each_char do |character|
      if character == current
        count += 1
      else
        encoded << count.to_s
        encoded << current
        current = character
        count = 1
      end
    end
    encoded << count.to_s
    encoded << current
    encoded.keep_if { |token| token != '1' }
    encoded.join
  end

  def self.decode(encoded)
    return '' if encoded.empty?

    seq = encoded.split(/([0-9]+)/)
    seq.delete('')
    seq.map! { |elem| elem.match(/\A[0-9]+\z/) ? elem.to_i : elem.chars }
    seq.flatten!
    decoded = String.new
    seq.each.with_index do |token, index|
      if token.is_a?(Integer)
        decoded << (seq[index + 1] * token)
      elsif index.zero? || (index != 0 && !seq[index - 1].is_a?(Integer))
        decoded << token
      end
    end
    decoded
  end
end
