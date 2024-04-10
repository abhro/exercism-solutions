# Uncomment the following line to enable bonus tests for Julia's number interfaces.
enable_bonus_tests = true

# define the RationalNumber type
struct RationalNumber{T <: Integer} <: Real
    numer::T
    denom::T
    function RationalNumber{T}(numer::T, denom::T) where {T <: Integer}
        iszero(denom) && iszero(denom) && throw(ArgumentError("0/0 not definable"))
        # The number 0 will always have 1 as its denominator
        if iszero(numer)
            denom = one(denom)
        end
        numer, denom = reducefactors(numer, denom)
        # The sign is carried by the numerator
        if isnegative(denom)
            numer, denom = -numer, -denom
        end
        return new(numer, denom)
    end
end
function RationalNumber(numer::N, denom::D) where {N, D}
    T = promote_type(N, D)
    return RationalNumber{T}(promote(numer, denom)...)
end
RationalNumber(a::T) where {T <: Integer} = RationalNumber{T}(a, one(a))
RationalNumber{T}(a::T) where {T <: Integer} = RationalNumber{T}(a, one(a))
function RationalNumber{T1}(a::T2) where {T1 <: Integer, T2 <: Integer}
    a = convert(T1, a)
    return RationalNumber{T1}(a, one(a))
end

function reducefactors(a::Integer, b::Integer)
    k = gcd(a, b)
    return (a ÷ k, b ÷ k)
end

# Implement methods to handle the following operations:

# Addition x + y
function Base.:(+)(a::RationalNumber, b::RationalNumber)
    denom = lcm(a.denom, b.denom)
    numer = a.numer * denom ÷ a.denom + b.numer * denom ÷ b.denom
    return RationalNumber(numer, denom)
end
Base.:(+)(a::RationalNumber, b::Integer) = RationalNumber(a.numer + b * a.denom, a.denom)

# Subtraction x - y
function Base.:(-)(a::RationalNumber, b::RationalNumber)
    denom = lcm(a.denom, b.denom)
    numer = a.numer * denom ÷ a.denom - b.numer * denom ÷ b.denom
    return RationalNumber(numer, denom)
end

# Multiplication x * y
Base.:(*)(a::RationalNumber, b::RationalNumber) = RationalNumber(a.numer * b.numer, a.denom * b.denom)

# Division x / y
Base.:(/)(a::RationalNumber, b::RationalNumber) = RationalNumber(a.numer * b.denom, a.denom * b.numer)

# Absolute value
Base.abs(a::RationalNumber) = RationalNumber(abs(a.numer), abs(a.denom))

# Exponentiation x ^ y
function Base.:(^)(a::RationalNumber, b::Integer)
    if iszero(b)
        return one(a)
    end
    if isnegative(b)
        return RationalNumber(a.denom^b, a.numer^b)
    end
    return RationalNumber(a.numer^b, a.denom^b)
end
function Base.:(^)(a::Real, b::RationalNumber)
    fac = isnegative(b) ? 1 / a^-b.numer : a^b.numer
    return fac^(1 / b.denom)
end

# Algebraic identities
Base.zero(a::RationalNumber) = RationalNumber(zero(a.numer), a.denom)
Base.one(a::RationalNumber) = RationalNumber(oneunit(a.numer), oneunit(a.denom))
Base.zero(::Type{RationalNumber{T}}) where {T <: Integer} = RationalNumber(zero(T), one(T))
Base.one(::Type{RationalNumber{T}}) where {T <: Integer} = RationalNumber(one(T), one(T))
Base.ispositive(a::RationalNumber) = ispositive(a.numer)
Base.isnegative(a::RationalNumber) = isnegative(a.numer)
Base.iszero(a::RationalNumber) = iszero(a.numer)
Base.numerator(a::RationalNumber) = a.numer
Base.denominator(a::RationalNumber) = a.denom

# Integrate into Julia's type system
Base.:(==)(a::RationalNumber, b::Integer) = a.numer == b && a.denom == one(a.denom)
Base.promote_rule(a::Type{RationalNumber{T}}, b::Type{T}) where {T <: Integer} = RationalNumber{T}

# Rational numbers are orderable
function Base.:(<)(a::RationalNumber, b::RationalNumber)
    denom = lcm(a.denom, b.denom)
    return a.numer * denom ÷ a.denom < b.numer * denom ÷ b.denom
end
