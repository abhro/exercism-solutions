function dft(x::AbstractVector)
    x̃ = similar(x, complex(eltype(x)))
    n = length(x)
    for k in eachindex(x̃)
        x̃[k] = sum(x .* exp.(2π * im * k * (0:(n - 1)) / n))
    end
    return reverse(x̃)
end

function fft(x::AbstractVector)
    n = length(x)
    if !isinteger(log(2, n))
        throw(ArgumentError("n must be a power of 2"))
    end
    x̃ = similar(x, complex(eltype(x)))
    return x̃
end
