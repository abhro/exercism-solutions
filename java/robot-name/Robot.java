import java.util.Random;

public class Robot {
    private static final int ALPHA_LENGTH = 2;
    private static final int DIGIT_LENGTH = 3;
    private static final int NAME_LENGTH = ALPHA_LENGTH + DIGIT_LENGTH;
    private static final char[] ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();
    private static final char[] DIGITS = "0123456789".toCharArray();

    String name;
    Random rng;

    public Robot() {
        rng = new Random(System.nanoTime());
        name = generateName();
    }


    public String getName() {
        return name;
    }

    public void reset() {
        rng.setSeed(System.nanoTime());
        name = generateName();
    }

    private String generateName() {
        char[] name = new char[NAME_LENGTH];

        for (int i = 0; i < ALPHA_LENGTH; i++) {
            name[i] = ALPHABET[rng.nextInt(ALPHABET.length)];
        }
        for (int i = ALPHA_LENGTH; i < NAME_LENGTH; i++) {
            name[i] = DIGITS[rng.nextInt(DIGITS.length)];
        }

        return new String(name);
    }
}
