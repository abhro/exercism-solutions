include("sets_categories_data.jl")

clean_ingredients(dish_name, dish_ingredients) = (dish_name, Set(dish_ingredients))

function check_drinks(drink_name, drink_ingredients)
    is_alcoholic = any(in(ALCOHOLS), drink_ingredients)
    suffix = is_alcoholic ? "Cocktail" : "Mocktail"
    return string(drink_name, " ", suffix)
end

function categorize_dish(dish_name, dish_ingredients)
    if all(in(VEGAN), dish_ingredients)
        category = "VEGAN"
    elseif all(in(VEGETARIAN), dish_ingredients)
        category = "VEGETARIAN"
    elseif all(in(PALEO), dish_ingredients)
        category = "PALEO"
    elseif all(in(KETO), dish_ingredients)
        category = "KETO"
    elseif all(in(OMNIVORE), dish_ingredients)
        category = "OMNIVORE"
    end
    return string(dish_name, ": ", category)
end

function tag_special_ingredients(dish)
    dish_name, ingredients = dish
    special_ingredients_in_dish = filter(in(SPECIAL_INGREDIENTS), ingredients)
    return (dish_name, Set(special_ingredients_in_dish))
end

compile_ingredients(dishes) = reduce(union, dishes)

separate_appetizers(dishes, appetizers) = collect(Set(filter(!in(appetizers), dishes)))

singleton_ingredients(dishes, intersection) = setdiff(compile_ingredients(dishes), intersection)
