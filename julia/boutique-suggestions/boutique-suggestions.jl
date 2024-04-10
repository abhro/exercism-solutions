clothingitem(categories, qualities) = Dict(c => q for (c, q) in zip(categories, qualities))
#clothingitem(categories, qualities) = Dict(categories .=> qualities)

get_combinations(tops, bottoms) = [(top, bot) for top in tops, bot in bottoms]

get_prices(combos) = [get_price(combo) for combo in combos]
get_price(combo) = first(combo)["price"] + last(combo)["price"]

filter_clashing(combos) = [combo for combo in combos if first(combo)["base_color"] != last(combo)["base_color"]]
