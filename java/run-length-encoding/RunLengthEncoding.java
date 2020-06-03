import java.util.Arrays;
import java.util.Scanner;
import java.util.ArrayList;

public class RunLengthEncoding {
    public String encode(String unencoded) {
        if (unencoded.isEmpty()) {
            return unencoded;
        }

        Scanner scanner = new Scanner(unencoded);
        ArrayList<String> seq = new ArrayList<>();
        char current = unencoded.charAt(0);
        int count = 0;
        for (char character: unencoded.toCharArray()) {
            if (character == current) {
                count += 1;
            }
            else {
                seq.add(String.valueOf(count));
                seq.add(String.valueOf(current));
                current = character;
                count = 1;
            }
        }
        seq.add(String.valueOf(count));
        seq.add(String.valueOf(current));
        StringBuilder encoded = new StringBuilder();
        seq.forEach(s -> { if (!s.equals("1")) encoded.append(s); });

        return encoded.toString();
    }

    public String decode(String encoded) {

        // here be dragons
        encoded = encoded.replaceAll(
            "(\\p{Digit}|\\p{IsAlphabetic}| )( |\\p{IsAlphabetic})", "$1\0$2");
        encoded = encoded.replaceAll(
            "(\\p{IsAlphabetic}| )( |\\p{IsAlphabetic}|\\p{Digit})", "$1\0$2");
        encoded = encoded.replaceAll(" (\\p{Digit})", " \0$1");
        encoded = encoded.replaceAll(
            "(\\p{IsAlphabetic})(\\p{Digit}|\\p{IsAlphabetic}| )", "$1\0$2");

        String[] seq = encoded.split("\0");

        StringBuilder decoded = new StringBuilder();
        for (int i = 0; i < seq.length; i++) {
            String token = seq[i];
            try {
                int quantifier = Integer.parseInt(token);
                token = seq[++i];
                decoded.append(token.repeat(quantifier));
            }
            catch (NumberFormatException ex) {
                decoded.append(token);
            }
        }
        return decoded.toString();
    }
}
