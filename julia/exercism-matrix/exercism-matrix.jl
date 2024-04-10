const E = [
    0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 1 0 0
    0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0
    0 1 0 0 0 1 0 0 0 0 0 0 1 0 0 0 1 0
    0 1 0 0 1 0 1 0 0 0 0 1 0 1 0 0 1 0
    0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0
    1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1
    0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0
    0 1 0 0 0 0 0 1 0 0 1 0 0 0 0 0 1 0
    0 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 0
    0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0
    0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 1 0 0
]

function frown!(E)
    mouth_indices = CartesianIndex.((7:9)', 7:12)
    E[mouth_indices] .= reverse(E[mouth_indices], dims = 2)
    return E
end

frown(E) = frown!(copy(E))

function stickerwall(E)
    divider_length = size(E, 2) * 2
    divider = fill(1, (1, divider_length))
    frowning_E = frown(E)
    return [E frowning_E; divider; frowning_E E]
end

function colpixelcount(E)
    E = copy(E)
    for i in axes(E, 2)
        count = sum(E[:, i])
        E[:, i] .*= count
    end
    return E
end

function render(E)
    lines = join.(eachrow(E), "")
    lines = replace.(lines, "0" => " ", r"[^0 ]" => "X")
    return join(lines, "\n")
end
