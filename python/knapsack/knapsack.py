def maximum_value(maximum_weight, items) -> int:
    "Greedy implementation"
    # sort by value
    items = sorted(items, key=lambda item: item['value'], reverse=True)
    current_weight = 0
    value = 0
    # loop over items
    for item in items:
        # see if weight slot allows for current item
        if current_weight + item['weight'] <= maximum_weight:
            # if so, add to value
            value += item['value']
            current_weight += item['weight']

    return value
