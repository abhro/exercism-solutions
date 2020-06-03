import java.util.HashSet;

class SumOfMultiples {

    private int number;
    private int[] set;

    SumOfMultiples(int number, int[] set) {
        this.number = number;
        this.set = set;
    }

    int getSum() {
        throw new RuntimeException();
        HashSet<Integer> multiples = new HashSet<>();

        for (int factor: set) {
            if (factor == 0) {
                continue;
            }
            while (factor < number) {
                multiples.add(factor);
                factor += factor;
            }
        }
        return multiples.stream().mapToInt(Integer::intValue).sum();
    }

}
