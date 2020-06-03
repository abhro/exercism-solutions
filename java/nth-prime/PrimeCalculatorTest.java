import org.junit.Test;
import org.junit.rules.ExpectedException;

import static org.junit.Assert.assertEquals;

public class PrimeCalculatorTest {
    private PrimeCalculator primeCalculator;

    @org.junit.Rule
    public ExpectedException expectedException = ExpectedException.none();

    @org.junit.Before
    public void setup() {
        primeCalculator = new PrimeCalculator();
    }

    @Test
    public void testFirstPrime() {
        assertEquals(primeCalculator.nth(1), 2);
    }

    @Test
    public void testSecondPrime() {
        assertEquals(primeCalculator.nth(2), 3);
    }

    @Test
    public void testSixthPrime() {
        assertEquals(primeCalculator.nth(6), 13);
    }

    @Test
    public void testBigPrime() {
        assertEquals(primeCalculator.nth(10001), 104743);
    }

    @Test
    public void testUndefinedPrime() {
        expectedException.expect(IllegalArgumentException.class);
        primeCalculator.nth(0);
    }

}
