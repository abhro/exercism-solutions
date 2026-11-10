# Define a custom type Fiberator
struct Fiberator
    n::Int
end

# Implement `iterate` method(s)
function Base.iterate(f::Fiberator, state = (; index = 1, a = 0, b = 1))
    (; index, a, b) = state
    if index > f.n
        return nothing
    end
    a, b = b, a + b
    index += 1
    return (a, (; index, a, b))
end

# Make `collect` work
Base.length(f::Fiberator) = f.n

# Enable Julia to infer element type
Base.eltype(::Type{Fiberator}) = Int
