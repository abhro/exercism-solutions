import java.util.Arrays;

class Yacht {

    private int[] rolls;
    private YachtCategory category;

    Yacht(int[] dice, YachtCategory yachtCategory) {
        rolls = dice;
        category = categorize(rolls, yachtCategory);
    }

    int score() {
        switch (category) {
            case YACHT:
                return 50;
            case ONES:
                return count(rolls, 1);
            case TWOS:
                return 2 * count(rolls, 2);
            case THREES:
                return 3 * count(rolls, 3);
            case FOURS:
                return 4 * count(rolls, 4);
            case FIVES:
                return 5 * count(rolls, 5);
            case SIXES:
                return 6 * count(rolls, 6);
            case FULL_HOUSE:
                return Arrays.stream(rolls).sum();
            case FOUR_OF_A_KIND:
                for (int roll: rolls) {
                    int count = count(rolls, roll);
                    if (count == 4) {
                        return count * roll;
                    }
                }
                return -1;
            case LITTLE_STRAIGHT:
                return 30;
            case BIG_STRAIGHT:
                return 30;
            case CHOICE:
                return Arrays.stream(rolls).sum();
        }
        return -1;
    }

    /** @return Number of times `needle` appears in `haystack` */
    private static int count(int[] haystack, int needle) {
        int counter = 0;
        for (int candidate: haystack) {
            if (needle == candidate) {
                counter++;
            }
        }
        return counter;
    }

    private static YachtCategory categorize(int[] rolls, YachtCategory default_) {
        Arrays.sort(rolls);
        if (Arrays.equals(rolls, new int[]{2, 3, 4, 5, 6})) {
            return YachtCategory.BIG_STRAIGHT;
        }
        if (Arrays.equals(rolls, new int[]{1, 2, 3, 4, 5})) {
            return YachtCategory.LITTLE_STRAIGHT;
        }
        return default_;
    }

}
