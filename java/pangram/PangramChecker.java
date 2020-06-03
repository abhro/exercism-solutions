public class PangramChecker {
    public boolean isPangram(String input) {
        input = input.toLowerCase();
        for (char letter = 'a'; letter <= 'z'; letter++) {
            if (input.indexOf(letter) < 0) {
                return false;
            }
        }

        return true;
    }
}
