using StatsBase: countmap

additems!(cart, items) = mergewith!(+, cart, countmap(items))

function update_recipes!(ideas, updates)

end

function send_to_store(cart, aislecodes)

end

function update_store_inventory!(inventory, cart)

end

function reorder!(outofstock, stock)

end
