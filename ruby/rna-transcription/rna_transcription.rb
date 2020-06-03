module Complement
  def self.of_dna(dna)
    transcription_table = {'C' => 'G', 'G' => 'C', 'T' => 'A', 'A' => 'U'}
    dna.each_char.map { |nucleotide| transcription_table[nucleotide] }.join
  end
end
