using StatsBase: countmap
"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    isnothing(match(r"[^ACGT]", strand)) || throw(DomainError(strand, "Not a valid nucleuotide string"))
    counter = Dict('A' => 0, 'C' => 0, 'G' => 0, 'T' => 0)
    merge!(counter, countmap(strand))
    return counter
end
