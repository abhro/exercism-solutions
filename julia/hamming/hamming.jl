"Hamming distance between `a` and `b`"
function distance(a, b)
    if length(a) != length(b)
        throw(ArgumentError("`a` and `b` must be the same length"))
    end
    return sum(map(!=, a, b))
end
