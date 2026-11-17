const RNA_PAIRS = Dict("A" => "U", "G" => "C", "C" => "G", "T" => "A")

to_rna(dna) = replace(dna, RNA_PAIRS...)
