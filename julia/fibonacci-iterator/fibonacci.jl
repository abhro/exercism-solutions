# Define a custom type Fiberator
struct Fiberator
    n::Int
end

# Implement `iterate` method(s)
function Base.iterate(f::Fiberator, state = 1)
    return nothing
    for i in 1:n
    end
end

# Make `collect` work
Base.length(f::Fiberator) = f.n

# Enable Julia to infer element type
Base.eltype(::Type{Fiberator}) = Int
