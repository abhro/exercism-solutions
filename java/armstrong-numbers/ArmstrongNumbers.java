import java.util.Vector;

class ArmstrongNumbers {
    boolean isArmstrongNumber(int numberToCheck) {
        int n = numberToCheck;
        Vector<Integer> digits = new Vector<Integer>();

        while (n > 0) {
            digits.add(n % 10);
            n /= 10;
        }

        int exponent = digits.size();

        int digitsum = 0;
        for (Integer i: digits) {
            digitsum += (int) Math.pow(i, exponent);
        }

        return numberToCheck == digitsum;
    }
}
