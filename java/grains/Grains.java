import java.math.BigInteger;

class Grains {

    BigInteger grainsOnSquare(final int square) {
        if (!(1 <= square && square <= 64)) {
            throw new IllegalArgumentException("square must be between 1 and 64");
        }
        return BigInteger.ONE.shiftLeft(square - 1);

    }

    BigInteger grainsOnBoard() {
        BigInteger total = BigInteger.ZERO;
        for (int square = 1; square <= 64; square++) {
            total = total.add(grainsOnSquare(square));
        }
        return total;
    }

}
