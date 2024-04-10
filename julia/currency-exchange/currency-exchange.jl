exchange_money(budget, exchange_rate) = budget / exchange_rate
get_change(budget, exchanging_value) = budget - exchanging_value
get_value_of_bills(denomination, number_of_bills) = denomination * number_of_bills
get_number_of_bills(amount, denomination) = trunc(Int, amount / denomination)

function get_leftover_of_bills(amount, denomination)
    amount_exchanged = denomination * get_number_of_bills(amount, denomination)
    return amount - amount_exchanged
end

function exchangeable_value(budget, exchange_rate, spread, denomination)
    error("Bugfix stage")
    amount_exchanged = denomination * get_number_of_bills(budget, denomination)
    fee = spread / 100 * amount_exchanged
    return amount_exchanged + fee
end
