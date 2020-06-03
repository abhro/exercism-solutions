class Darts {

    double distance;

    Darts(double x, double y) {
        distance = Math.sqrt(x*x + y*y);
    }

    int score() {
        if (distance > 10) return 0; // out of board
        if (distance > 5) return 1;  // outer circle
        if (distance > 1) return 5;  // inner circle
        return 10;
    }

}
