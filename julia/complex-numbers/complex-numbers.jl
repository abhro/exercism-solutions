# Uncomment the following line to enable bonus tests involving arithmetic between real numbers and complex numbers.
enable_realcomplex_tests = true

# Uncomment the following line to enable bonus tests for syntax sugar.
enable_syntaxsugar_tests = true

struct ComplexNumber{T <: Real} <: Number
    real::T
    imag::T
end
function ComplexNumber(real::R, imag::I) where {R, I}
    T = promote_type(R, I)
    return ComplexNumber{T}(promote(real, imag)...)
end

const jm = ComplexNumber(false, true)
# Identity and structure manipulation
Base.real(z::ComplexNumber) = z.real
Base.imag(z::ComplexNumber) = z.imag
Base.:(==)(z::ComplexNumber, w::ComplexNumber) = z.real == w.real && z.imag == w.imag
function Base.isapprox(z::ComplexNumber, w::ComplexNumber; kwargs...)
    return isapprox(z.real, w.real; kwargs...) && isapprox(z.imag, w.imag; kwargs...)
end

# Form a vector space
Base.:(+)(z::ComplexNumber, w::ComplexNumber) = ComplexNumber(z.real + w.real, z.imag + w.imag)
Base.:(-)(z::ComplexNumber, w::ComplexNumber) = ComplexNumber(z.real - w.real, z.imag - w.imag)
Base.:(*)(c::Real, z::ComplexNumber) = ComplexNumber(z.real * c, z.imag * c)
Base.:(*)(z::ComplexNumber, c::Real) = c * z
Base.:(/)(z::ComplexNumber, c::Real) = ComplexNumber(z.real / c, z.imag / c)

# Form a field or an algebra or whatever
Base.:(+)(z::ComplexNumber, c::Real) = ComplexNumber(z.real + c, z.imag)
Base.:(-)(z::ComplexNumber, c::Real) = ComplexNumber(z.real - c, z.imag)
Base.:(+)(c::Real, z::ComplexNumber) = ComplexNumber(z.real + c, z.imag)
Base.:(-)(c::Real, z::ComplexNumber) = ComplexNumber(c - z.real, -z.imag)
Base.abs(z::ComplexNumber) = hypot(z.real, z.imag)
Base.abs2(z::ComplexNumber) = z.real * z.real + z.imag * z.imag
Base.conj(z::ComplexNumber) = ComplexNumber(z.real, -z.imag)

function Base.:(*)(z::ComplexNumber, w::ComplexNumber)
    a, b = z.real, z.imag
    c, d = w.real, w.imag
    return ComplexNumber(a * c - b * d, b * c + a * d)
end
function Base.:(/)(c::Real, z::ComplexNumber)
    a, b = z.real, z.imag
    return ComplexNumber(a * c, -b * c) / abs2(z)
end
function Base.:(/)(z::ComplexNumber, w::ComplexNumber)
    a, b = z.real, z.imag
    c, d = w.real, w.imag
    return ComplexNumber(a * c + b * d, b * c - a * d) / abs2(w)
end

Base.exp(z::ComplexNumber) = exp(z.real) * ComplexNumber(cos(z.imag), sin(z.imag))
