import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;

import static org.junit.Assert.assertEquals;

public class CollatzCalculatorTest {

    @Rule
    public ExpectedException expectedException = ExpectedException.none();

    @Test
    public void testZeroStepsRequiredWhenStartingFrom1() {
        assertEquals(0, CollatzCalculator.computeStepCount(1));
    }

    @Test
    public void testCorrectNumberOfStepsWhenAllStepsAreDivisions() {
        assertEquals(4, CollatzCalculator.computeStepCount(16));
    }

    @Test
    public void testCorrectNumberOfStepsWhenBothStepTypesAreNeeded() {
        assertEquals(9, CollatzCalculator.computeStepCount(12));
    }

    @Test
    public void testAVeryLargeInput() {
        assertEquals(152, CollatzCalculator.computeStepCount(1000000));
    }

    @Test
    public void testZeroIsConsideredInvalidInput() {
        expectedException.expect(IllegalArgumentException.class);
        expectedException.expectMessage("Only natural numbers are allowed");

        CollatzCalculator.computeStepCount(0);
    }

    @Test
    public void testNegativeIntegerIsConsideredInvalidInput() {
        expectedException.expect(IllegalArgumentException.class);
        expectedException.expectMessage("Only natural numbers are allowed");

        CollatzCalculator.computeStepCount(-15);
    }

}
