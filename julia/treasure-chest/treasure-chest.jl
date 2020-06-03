# define the TreasureChest{T} type
struct TreasureChest{T}
    password::String
    treasure::T
end

function get_treasure(password_attempt, chest)
    return chest.password == password_attempt ? chest.treasure : nothing
end

function multiply_treasure(multiplier, chest)
    return TreasureChest(chest.password, fill(chest.treasure, multiplier))
end
