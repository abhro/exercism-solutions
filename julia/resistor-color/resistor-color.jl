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
colorcode(color) = COLOR_CODES[color]

colors() = sort(keys(COLOR_CODES), by = c -> COLOR_CODES[c])
