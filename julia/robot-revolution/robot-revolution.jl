using LinearAlgebra: normalize

orientrobot(vecs) = reduce(hcat, normalize.(vecs))

rotaterobot(orientation, θ) = rotmat2d(θ) * orientation

function rotmat2d(θ)
    S, C = sincos(θ)
    return [C -S; S C]
end

robotoriented(orientation, direction) = normalize(direction) == orientation[:, 2]

bodylocation(orientation, position) = orientation .+ position
