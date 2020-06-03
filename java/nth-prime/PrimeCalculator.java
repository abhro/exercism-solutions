class PrimeCalculator {
    public static int nth(int n) {
        if (n <= 0) {
            throw new IllegalArgumentException(String.format(
                "%dth prime does not exist", n));
        }

        switch (n) {
            case 1:
                return 2;
            case 2:
                return 3;
            case 3:
                return 5;
            case 4:
                return 7;
            case 5:
                return 11;
            default:
                int i = 6;
                int candidate = 13;
                while (i < n) {
                    candidate += 2;
                    if (isPrime(candidate)) {
                        i++;
                    }
                }

                return candidate;
        }
    }

    public static boolean isPrime(int n) {
        if (n <= 3) {
            return n > 1;
        }
        if (n % 2 == 0 || n % 3 == 0) {
            return false;
        }

        int i = 5;
        while (i * i <= n) {
            if (n % i == 0 || n % (i + 2) == 0) {
                return false;
            }
            i += 6;
        }

        return true;
    }
}
