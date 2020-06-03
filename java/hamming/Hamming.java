class Hamming {

    String strand1;
    String strand2;
    int strandLength;

    Hamming(String leftStrand, String rightStrand) {
        if (leftStrand.length() != rightStrand.length()) {
            if (leftStrand.length() == 0) {
                throw new IllegalArgumentException("left strand must not be empty.");
            }
            if (rightStrand.length() == 0) {
                throw new IllegalArgumentException("right strand must not be empty.");
            }
            throw new IllegalArgumentException("leftStrand and rightStrand must be of equal length.");
        }

        strand1 = leftStrand;
        strand2 = rightStrand;
        strandLength = leftStrand.length();
    }

    int getHammingDistance() {
        int difference = 0;
        for (int i = 0; i < strandLength; i++) {
            if (strand1.charAt(i) != strand2.charAt(i)) {
                difference += 1;
            }
        }
        return difference;
    }

}
