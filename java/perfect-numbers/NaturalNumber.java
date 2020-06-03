class NaturalNumber {

    private int aliquotSum;
    private int n;

    NaturalNumber(int n) {
        if (n <= 0) {
            throw new IllegalArgumentException("You must supply a natural number (positive integer)");
        }
        this.n = n;
        this.aliquotSum = calculateAliquotSum();
    }

    Classification getClassification() {
        if (aliquotSum == n) {
            return Classification.PERFECT;
        }
        if (aliquotSum > n) {
            return Classification.ABUNDANT;
        }
        return Classification.DEFICIENT;
    }

    private int calculateAliquotSum() {
        int factorSum = 0;
        int upperBound = n / 2 + 1;
        for (int candidate = 1; candidate < upperBound; candidate++) {
            if (n % candidate == 0) {
                factorSum += candidate;
            }
        }

        return factorSum;
    }
}
