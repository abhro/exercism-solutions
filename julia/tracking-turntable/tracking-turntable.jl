z(x, y) = x + y * im
euler(r, θ) = r * exp(im * θ)

rotate(x, y, θ) = reim(z(x, y) * exp(im * θ))
rdisplace(x, y, r) = reim(z(x, y) * (1 + r / hypot(x, y)))

findsong(x, y, r, θ) = rotate(rdisplace(x, y, r)..., θ)
