import java.util.Arrays;

class LuhnValidator {
    static boolean isValid(String candidate) {
        candidate = candidate.replaceAll(" ", "");
        int length = candidate.length();
        if (length < 2 || candidate.matches(".+[^0-9].+")) {
            return false;
        }

        int[] numerics = new int[length];
        int bigMod = length - 1;
        for (int i = length - 1; i >= 0; i--) {
            int numericValue = Character.getNumericValue(candidate.charAt(i));
            numerics[i] = (bigMod - i) % 2 == 0 ? numericValue : numericValue * 2;
            if (numerics[i] > 9) {
                numerics[i] -= 9;
            }
        }
        return Arrays.stream(numerics).sum() % 10 == 0;
    }
}
