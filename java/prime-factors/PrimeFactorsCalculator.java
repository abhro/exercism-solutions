import java.util.ArrayList;
import java.util.List;

public class PrimeFactorsCalculator {
    public List<Long> calculatePrimeFactorsOf(long number) {
        ArrayList<Long> factors = new ArrayList<>();

        while (number % 2 == 0) {
            factors.add(2L);
            number /= 2;
        }

        long factor = 3;
        while (number > 1) {
            if (number % factor == 0) {
                factors.add(factor);
                number /= factor;
            }
            else {
                factor += 2;
            }
        }

        return factors;
    }
}
