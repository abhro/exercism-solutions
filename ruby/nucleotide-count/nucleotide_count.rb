# frozen_string_literal: true

# Some weird protein crap or sth
class Nucleotide
  ILLEGAL_MOLECULES = Regexp.compile(/([^ACGT])/)
  private_constant :ILLEGAL_MOLECULES

  def initialize(nucleotides)
    nucleotides = nucleotides.strip.upcase
    matcher = nucleotides.match(ILLEGAL_MOLECULES)
    raise ArgumentError, "Illegal nucleotide #{matcher[0]}" unless matcher.nil?

    @nucleotides = nucleotides
    @counter = nil
  end

  def count(nucleotide)
    histogram[nucleotide]
  end

  def histogram
    populate_counter if @counter.nil?
    @counter
  end

  class << self
    alias from_dna new
  end

  private

  def populate_counter
    @counter = { 'A' => 0, 'C' => 0, 'G' => 0, 'T' => 0 }
    @nucleotides.each_char { |c| @counter[c] += 1 }
  end
end
