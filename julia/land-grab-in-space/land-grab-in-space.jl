# define the Coord type
struct Coord
    x::UInt16
    y::UInt16
end

# define the Plot keyword type
@kwdef struct Plot
    bottom_left::Coord
    top_right::Coord
end

function is_claim_staked(claim::Plot, register::Set{Plot})
    return claim in register
end

function stake_claim!(claim::Plot, register::Set{Plot})
    if is_claim_staked(claim, register)
        return false
    end
    push!(register, claim)
    return true
end

function get_longest_side(claim::Plot)
    length = claim.top_right.x - claim.bottom_left.x
    width = claim.top_right.y - claim.bottom_left.y
    return max(length, width)
end

function get_claim_with_longest_side(register::Set{Plot})
    max_side_length = maximum(get_longest_side, register)
    longest_side_plots = filter(plot -> get_longest_side(plot) == max_side_length, register)
    return Set(longest_side_plots)
end
