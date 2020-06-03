class CollatzCalculator {

    public static int computeStepCount(int start) {
        if (start <= 0) {
            throw new IllegalArgumentException("Only natural numbers are allowed");
        }
        int steps = 0;

        while (start != 1) {
            start = (start % 2 == 0) ? start / 2 : 3 * start + 1;
            steps++;
        }

        return steps;
    }

}
