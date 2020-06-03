import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class ReverseStringTest {

    private ReverseString reverser;

    @org.junit.Before
    public void setUp() {
        reverser = new ReverseString();
    }

    @Test
    public void testAnEmptyString() {
        assertEquals("", reverser.reverse(""));
    }

    @Test
    public void testAWord() {
        assertEquals("tobor", reverser.reverse("robot"));
    }

    @Test
    public void testACapitalizedWord() {
        assertEquals("nemaR", reverser.reverse("Ramen"));
    }

    @Test
    public void testASentenceWithPunctuation() {
        assertEquals("!yrgnuh m'I", reverser.reverse("I'm hungry!"));
    }

    @Test
    public void testAPalindrome() {
        assertEquals("racecar", reverser.reverse("racecar"));
    }

    @Test
    public void testAnEvenSizedWord() {
        assertEquals("reward", reverser.reverse("drawer"));
    }
}
