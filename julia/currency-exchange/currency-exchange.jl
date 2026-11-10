exchange_money(budget, exchange_rate) = budget / exchange_rate
get_change(budget, exchanging_value) = budget - exchanging_value
get_value_of_bills(denomination, number_of_bills) = denomination * number_of_bills
get_number_of_bills(amount, denomination) = trunc(Int, amount / denomination)

function get_leftover_of_bills(amount, denomination)
    amount_exchanged = denomination * get_number_of_bills(amount, denomination)
    return amount - amount_exchanged
end

function exchangeable_value(budget, exchange_rate, spread, denomination)
    real_rate = exchange_rate * (1 + spread / 100)
    complete_exchange = exchange_money(budget, real_rate)
    return denomination * get_number_of_bills(complete_exchange, denomination)
end
