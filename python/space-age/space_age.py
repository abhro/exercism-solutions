# -*- coding: utf-8 -*-

class SpaceAge:

    planets_to_years = { # orbital period of each planet
        'earth': 31557600.0,
        'mercury': 7600543.81992,
        'venus': 19414149.052176,
        'mars': 59354032.69008,
        'jupiter': 374355659.124,
        'saturn': 929292362.8848,
        'uranus': 2651370019.3296,
        'neptune': 5200418560.032001,
    }

    def __init__(self, seconds):
        self.seconds = seconds

    def on_planet(self, planet: str) -> float:
        'Return number of years passed on `planet` planet.'
        try:
            return round(self.seconds / self.__class__.planets_to_years[planet], 2)
        except KeyError:
            raise ValueError(f"Planet '{planet}' not supported.") from None

    def __getattr__(self, attr: str):
        if attr[3:] in self.planets_to_years: # remove on_ prefix
            return lambda: self.on_planet(attr[3:])
        try:
            return self.__dict__[attr]
        except KeyError:
            raise AttributeError(
                f"'{type(self).__name__}' has no attribute '{attr}'") from None
