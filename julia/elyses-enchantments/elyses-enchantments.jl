get_item(stack, position) = stack[position]

function set_item!(stack, position, replacement_card)
    stack[position] = replacement_card
    return stack
end

insert_item_at_top!(stack, new_card) = push!(stack, new_card)
insert_item_at_bottom!(stack, new_card) = pushfirst!(stack, new_card)

remove_item!(stack, position) = deleteat!(stack, position)

function remove_item_from_top!(stack)
    pop!(stack)
    return stack
end

function remove_item_at_bottom!(stack)
    popfirst!(stack)
    return stack
end

check_size_of_stack(stack, stack_size) = length(stack) == stack_size
