module Grep
  def self.grep(pattern: //, flags: [], files: [])
    parse_flags(flags)
    pattern = Regexp.new(pattern, Regexp::IGNORECASE)
    files.each do |filename|
      IO.readlines filename do |line|
        puts line if line.match? pattern
      end
    end
  end

  def self.parse_flags(flags: [])
    add_line_numbers = only_filenames =
                         case_insensitive = invert_match = entire_lines = false
    flags.each do |flag|
      case flag
      when '-n'
        add_line_numbers = true
      when '-l'
        only_filenames = true
      when '-i'
        case_insensitive = true
      when '-v'
        invert_match = true
      when '-x'
        entire_lines = true
      end
    end
  end
end
