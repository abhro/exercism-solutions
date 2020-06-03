# frozen_string_literal: true

#
# Low-level teenager simulator
#
module Bob
  def self.hey(remark)
    remark = remark.strip
    return 'Fine. Be that way!' if remark.empty?

    pattern = Regexp.compile('[A-Za-z]')

    if remark.end_with?('?')
      if remark.match(pattern) && remark.upcase == remark
        return "Calm down, I know what I'm doing!"
      end

      return 'Sure.'
    end
    if remark.match(pattern) && remark.upcase == remark
      return 'Whoa, chill out!'
    end

    'Whatever.'
  end
end
