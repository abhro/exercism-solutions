class SpaceAge {
    private double seconds;

    SpaceAge(double seconds) {
        this.seconds = seconds;
    }

    double getSeconds() {
        return seconds;
    }

    double onEarth()   { return seconds / 31557600.0; }
    double onMercury() { return seconds / 7600543.81992; }
    double onVenus()   { return seconds / 19414149.052176; }
    double onMars()    { return seconds / 59354032.69008; }
    double onJupiter() { return seconds / 374355659.124; }
    double onSaturn()  { return seconds / 929292362.8848; }
    double onUranus()  { return seconds / 2651370019.3296; }
    double onNeptune() { return seconds / 5200418560.032001; }

}
