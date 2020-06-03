import java.util.Scanner;
import java.util.regex.Pattern;
import java.util.regex.MatchResult;

class Acronym {
    // String phrase; // uncomment this to make possible a lazy implementation
    String acronym;

    private static String initial_pattern = "\\b([A-Za-z])";
    private static String ignore_pattern = "['_]";

    Acronym(String phrase) {
        Scanner scanner = new Scanner(phrase.replaceAll(ignore_pattern, ""));
        Object[] initials = scanner.findAll(initial_pattern).toArray();
        StringBuffer buf = new StringBuffer();
        for (Object initial: initials) {
            buf.append(((MatchResult) initial).group(0));
        }
        this.acronym = buf.toString().toUpperCase();
    }

    String get() {
        return acronym;
    }

}
