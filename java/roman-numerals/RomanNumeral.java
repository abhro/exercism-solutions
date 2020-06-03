public class RomanNumeral {
    static String ONE = "I";
    static String FIVE = "V";
    static String TEN = "X";
    static String FIFTY = "L";
    static String HUNDRED = "C";
    static String FIVE_HUNDRED = "D";
    static String THOUSAND = "M";

    private int decimal;

    public RomanNumeral(int decimal) {
        this.decimal = decimal;
    }

    public String getRomanNumeral() {
        StringBuilder roman = new StringBuilder();
        int decimal = this.decimal; // keep a copy
        int[] bases = {1000, 500, 100, 50, 10, 5, 1};
        for (int i = 0; i < bases.length; i++) {
            int base = bases[i];
            while (decimal >= base) {
                // XXX bad code
                if (i > 0 && decimal == bases[i - 1] - 1) {
                    roman.append("I");
                    roman.append(RomanNumeral.magic(bases[i - 1]));
                }
                else {
                    roman.append(RomanNumeral.magic(base));
                }
                decimal -= base;
            }
        }

        return roman.toString();
    }

    public static String getRomanNumeral(int decimal) {
        return new RomanNumeral(decimal).getRomanNumeral();
    }

    private static String magic(int ordinal) {
        switch (ordinal) {
            case 1:     return ONE;
            case 5:     return FIVE;
            case 10:    return TEN;
            case 50:    return FIFTY;
            case 100:   return HUNDRED;
            case 500:   return FIVE_HUNDRED;
            case 1000:  return THOUSAND;
            default: throw new IllegalArgumentException("Invalid decimal base");
        }
    }
}
