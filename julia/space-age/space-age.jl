const ORBITAL_PERIODS = Dict(
    "Mercury" => 0.2408467,
    "Venus" => 0.61519726,
    "Earth" => 1.0,
    "Mars" => 1.8808158,
    "Jupiter" => 11.862615,
    "Saturn" => 29.447498,
    "Uranus" => 84.016846,
    "Neptune" => 164.79132,
)

const EARTH_YEAR = 31_557_600 # = 365.25 * 24 * 60 * 60

onPlanet(seconds, planet) = seconds / (ORBITAL_PERIODS[planet] * EARTH_YEAR)

onEarth(seconds) = onPlanet(seconds, "Earth")
onMercury(seconds) = onPlanet(seconds, "Mercury")
onVenus(seconds) = onPlanet(seconds, "Venus")
onMars(seconds) = onPlanet(seconds, "Mars")
onJupiter(seconds) = onPlanet(seconds, "Jupiter")
onSaturn(seconds) = onPlanet(seconds, "Saturn")
onUranus(seconds) = onPlanet(seconds, "Uranus")
onNeptune(seconds) = onPlanet(seconds, "Neptune")
