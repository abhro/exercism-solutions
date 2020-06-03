class LargestSeriesProductCalculator {
    private final String number;

    LargestSeriesProductCalculator(String inputNumber) {
        if (inputNumber.matches(".*[^0-9].*")) {
            throw new IllegalArgumentException("String to search may only contain digits.");
        }

        number = inputNumber;
    }

    long calculateLargestProductForSeriesLength(int numberOfDigits) {
        if (numberOfDigits < 0) {
            throw new IllegalArgumentException("Series length must be non-negative.");
        }
        if (number.length() < numberOfDigits) {
            throw new IllegalArgumentException(
                "Series length must be less than or equal to the length of the string to search.");
        }
        if (number.isEmpty()) {
            return 1;
        }

        long max_product = 0;
        int bounds = number.length() - numberOfDigits + 1;
        for (int i = 0; i < bounds; i++) {
            long product = digitProduct(number.substring(i, i + numberOfDigits));
            if (product > max_product) {
                max_product = product;
            }
        }

        return max_product;
    }

    static int digitProduct(String digits) {
        return digits.codePoints()
                     .map(n -> n - '0')
                     .reduce(1, (acc, item) -> (acc * item));
    }
}
