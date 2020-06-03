using StatsBase: countmap

create_inventory(items) = countmap(items)

add_items(inventory, items) = mergewith(+, inventory, create_inventory(items))

function decrement_items(inventory, items)
    for item in items
        if item in keys(inventory) && inventory[item] > 0
            inventory[item] -= 1
        end
    end
    return inventory
end

remove_item(inventory, item) = item in keys(inventory) ? delete!(inventory, item) : inventory

list_inventory(inventory) = sort(filter(>(0) ∘ last, collect(pairs(inventory))), by = first)
