isarmstrong(n) = n == armstrong_seq(n)

function armstrong_seq(n)
    if iszero(n)
        return zero(n)
    end
    k = floor(Int, log10(n)) + 1 # number of digits
    s = 0
    quot = n
    for i in 1:k
        quot, rem = divrem(quot, 10)
        s += rem^k
    end
    return s
end
