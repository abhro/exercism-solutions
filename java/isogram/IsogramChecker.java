import java.util.HashSet;

class IsogramChecker {
    boolean isIsogram(String phrase) {
        HashSet<Character> presence = new HashSet<>();
        for (char c: phrase.toLowerCase().toCharArray()) {
            if (c == ' ' || c == '-') {
                continue;
            }
            if (presence.contains(c)) {
                return false;
            }
            presence.add(c);
        }

        return true;
    }
}
