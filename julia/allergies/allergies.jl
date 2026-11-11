const ALLERGIES = Dict(
    "eggs" => 1,
    "peanuts" => 2,
    "shellfish" => 4,
    "strawberries" => 8,
    "tomatoes" => 16,
    "chocolate" => 32,
    "pollen" => 64,
    "cats" => 128,
)
allergic_to(score, allergen) = !iszero(ALLERGIES[allergen] & score)

allergy_list(score) = Set(filter(Base.Fix1(allergic_to, score), keys(ALLERGIES)))
