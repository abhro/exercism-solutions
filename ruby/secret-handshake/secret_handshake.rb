class SecretHandshake
  def initialize(code)
    @ops = code
  end

  CODE_TABLE = [
    ['wink', 1], ['double blink', 2], ['close your eyes', 4], ['jump', 8]
  ].freeze

  private_constant :CODE_TABLE

  def commands
    instructions = []
    return instructions unless @ops.is_a? Integer

    CODE_TABLE.each do |instruction, op|
      instructions.push(instruction) if @ops & op != 0
    end
    instructions.reverse! if @ops & 16 != 0

    instructions
  end
end
