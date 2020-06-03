import java.util.ArrayList;
import java.util.Objects;
import java.util.List;
import java.util.stream.IntStream;

class Sieve {
    int limit;
    Sieve(int maxPrime) {
        if (maxPrime < 1) {
            throw new IllegalArgumentException(String.format(
                "%d is not a valid limit.", maxPrime));
        }
        limit = maxPrime;
    }

    List<Integer> getPrimes() {
        ArrayList<Integer> primes = new ArrayList<>();
        // populate primes array
        IntStream.rangeClosed(2, limit).forEach(primes::add);

        for (int i = 0, n = primes.size(); i < n; i++) {
            Integer base = primes.get(i);
            if (base == null) { // number is composite
                continue;
            }

            // relies that the interval space is 1. ie, the space between two
            // numbers and their indices is the same.
            for (int j = i + base; j < n; j += base) {
                // number is a multiple of base, and thus, composite
                primes.set(j, null);
            }
        }

        primes.removeIf(Objects::isNull); // remove composite placeholders

        return primes;
    }

    // the way it should be in a sane programming language. just one function
    // with one parameter
    static List<Integer> getPrimes(int limit) {
        return new Sieve(limit).getPrimes();
    }
}
