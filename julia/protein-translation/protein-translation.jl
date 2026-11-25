const PROTEIN_CODES = Dict(
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine", "UUC" => "Phenylalanine",
    "UUA" => "Leucine", "UUG" => "Leucine",
    "UCU" => "Serine", "UCC" => "Serine", "UCA" => "Serine", "UCG" => "Serine",
    "UAU" => "Tyrosine", "UAC" => "Tyrosine",
    "UGU" => "Cysteine", "UGC" => "Cysteine",
    "UGG" => "Tryptophan",
    "UAA" => "STOP", "UAG" => "STOP", "UGA" => "STOP",
)

function proteins(strand)
    proteins = String[]
    for codon in Iterators.partition(strand, 3)
        protein = decode_codon(codon)
        if protein == "STOP"
            break
        end
        push!(proteins, protein)
    end
    return proteins
end

function decode_codon(codon)
    length(codon) == 3 || throw(DomainError(codon, "Incomplete RNA sequence"))
    protein = get(PROTEIN_CODES, codon, missing)
    ismissing(protein) && throw(DomainError(codon, "Invalid RNA sequence"))
    return protein
end
