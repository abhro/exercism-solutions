using StatsBase: countmap

additems!(cart, items) = mergewith!(+, cart, countmap(items))

update_recipes!(ideas, updates) = merge!(ideas, updates)

send_to_store(cart, aislecodes) = sort([aislecodes[item] => qty for (item, qty) in pairs(cart)], by = first)

function update_store_inventory!(inventory, cart)
    mergewith!(-, inventory, cart)
    return filter(p -> iszero(p.second), inventory)
end

function reorder!(outofstock, stock)
    for k in keys(outofstock)
        outofstock[k] += get(stock, k, 100)
    end
    return outofstock
end
