StringOrMissing = Union{String, Missing} # type union definition
IntOrNothing = Union{Int64, Nothing} # type union definition

@kwdef mutable struct Player
    name::StringOrMissing = missing
    level::Int64 = 0
    health::Int64 = 100
    mana::IntOrNothing = nothing
end

introduce(player::Player) = ismissing(player.name) ? "Mighty Magician" : player.name

increment(::Nothing) = 50
increment(mana::Int64) = mana + 100

increment(::Missing) = "The Great"
increment(name::String) = "$name the Great"

function title!(player::Player)
    if player.level == 42
        player.name = increment(player.name)
    end
    return player.name
end

function revive!(player::Player)
    if iszero(player.health)
        player.health = 100
        player.mana = increment(player.mana)
    end
    return player
end
