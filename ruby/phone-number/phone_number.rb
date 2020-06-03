# frozen_string_literal: true

class PhoneNumber
  # :param: number is a String
  # :return: number if number represents a valid NANP phone number
  def self.clean(number)
    number = number.gsub(/[-.() +]/, '')
    number = number[1...number.length] if number[0] == '1'
    number if number.match(/\A[2-9]\d{2}[2-9]\d{2}\d{4}\z/)
  end
end
