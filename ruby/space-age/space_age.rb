class SpaceAge

  def initialize(seconds)
    @seconds = seconds
  end

  @@planets_to_years = { # orbital period of each planet
    on_earth: 31557600.0,
    on_mercury: 7600543.81992,
    on_venus: 19414149.052176,
    on_mars: 59354032.69008,
    on_jupiter: 374355659.124,
    on_saturn: 929292362.8848,
    on_uranus: 2651370019.3296,
    on_neptune: 5200418560.032001,
  }

  def method_missing(m, *args, &block)
    return (@seconds / @@planets_to_years[m]) if @@planets_to_years.has_key? m

    raise NoMethodError, "undefined method `#{m}' for #{self.inspect}"
  end
end
