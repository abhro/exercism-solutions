using StatsBase: sample

const planetary_classes = ['D', 'H', 'J', 'K', 'L', 'M', 'N', 'R', 'T', 'Y']
random_planet() = rand(planetary_classes)

random_ship_registry_number() = "NCC-$(rand(1000:9999))"

random_stardate() = 41_000 + 1000 * rand()

random_stardate_v2() = round(random_stardate(), digits = 1)

pick_starships(starships, number_needed) = sample(starships, number_needed, replace = false)
