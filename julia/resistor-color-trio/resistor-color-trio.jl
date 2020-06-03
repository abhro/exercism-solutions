const COLOR_CODES = Dict(
    "black" => 0,
    "brown" => 1,
    "red" => 2,
    "orange" => 3,
    "yellow" => 4,
    "green" => 5,
    "blue" => 6,
    "violet" => 7,
    "grey" => 8,
    "white" => 9,
)
function label(colors)
    resistance = (COLOR_CODES[colors[1]] * 10 + COLOR_CODES[colors[2]]) * 10^COLOR_CODES[colors[3]]

    if resistance ≥ 1_000_000_000
        return string(resistance ÷ 1_000_000_000, " gigaohms")
    elseif resistance ≥ 1_000_000
        return string(resistance ÷ 1_000_000, " megaohms")
    elseif resistance ≥ 1000
        return string(resistance ÷ 1000, " kiloohms")
    else
        return string(resistance, " ohms")
    end
end
