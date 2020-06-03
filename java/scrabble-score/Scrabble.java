import java.util.HashMap;

class Scrabble {

    private static final HashMap<Character, Byte> SCORE_TABLE = new HashMap<>();
    static {
        for (char c: "aeioulnrst".toCharArray()) SCORE_TABLE.put(c, (byte) 1);
        for (char c: "dg".toCharArray())         SCORE_TABLE.put(c, (byte) 2);
        for (char c: "bcmp".toCharArray())       SCORE_TABLE.put(c, (byte) 3);
        for (char c: "fhvwy".toCharArray())      SCORE_TABLE.put(c, (byte) 4);
                                                 SCORE_TABLE.put('k', (byte) 5);
        for (char c: "jx".toCharArray())         SCORE_TABLE.put(c, (byte) 8);
        for (char c: "qz".toCharArray())         SCORE_TABLE.put(c, (byte) 10);
    }

    private String word;
    private Integer score = null; // caching

    Scrabble(String word) {
        this.word = word;
    }

    int getScore() { // lazy evaluation and caching
        if (word == null) {
            return 0;
        }
        if (score != null) {
            return score;
        }
        int sum = 0;
        for (char c: word.toCharArray()) {
            sum += SCORE_TABLE.get(Character.toLowerCase(c));
        }
        score = sum;
        return sum;
    }

}
