const juice_times = Dict(
    "Pure Strawberry Joy" => 0.5,
    "Energizer" => 1.5,
    "Green Garden" => 1.5,
    "Tropical Island" => 3,
    "All or Nothing" => 5,
)

time_to_mix_juice(juice) = get(juice_times, juice, 2.5)

const lime_density = Dict("small" => 6, "medium" => 8, "large" => 10)

wedges_from_lime(size) = lime_density[size]

function limes_to_cut(wedges_needed, limes)
    lime_count = 0
    for lime in limes
        if wedges_needed < 1
            break
        end
        wedges_needed -= wedges_from_lime(lime)
        lime_count += 1
    end
    return lime_count
end

order_times(orders) = map(time_to_mix_juice, orders)

function remaining_orders(time_left, orders)
    allowed_orders = empty(orders)
    while time_left > 0 && !isempty(orders)
        order = popfirst!(orders)
        push!(allowed_orders, order)
        time_left -= time_to_mix_juice(order)
    end
    return orders
end
