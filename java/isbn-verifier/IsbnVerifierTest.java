import org.junit.Test;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertFalse;

public class IsbnVerifierTest {
    @Test
    public void validIsbnNumber() {
        assertTrue(IsbnVerifier.isValid("3-598-21508-8"));
    }

    @Test
    public void invalidIsbnCheckDigit() {
        assertFalse(IsbnVerifier.isValid("3-598-21508-9"));
    }

    @Test
    public void validIsbnNumberWithCheckDigitOfTen() {
        assertTrue(IsbnVerifier.isValid("3-598-21507-X"));
    }

    @Test
    public void checkDigitIsACharacterOtherThanX() {
        assertFalse(IsbnVerifier.isValid("3-598-21507-A"));
    }

    @Test
    public void invalidCharacterInIsbn() {
        assertFalse(IsbnVerifier.isValid("3-598-P1581-X"));
    }

    @Test
    public void xIsOnlyValidAsACheckDigit() {
        assertFalse(IsbnVerifier.isValid("3-598-2X507-9"));
    }

    @Test
    public void validIsbnWithoutSeparatingDashes() {
        assertTrue(IsbnVerifier.isValid("3598215088"));
    }

    @Test
    public void isbnWithoutSeparatingDashesAndXAsCheckDigit() {
        assertTrue(IsbnVerifier.isValid("359821507X"));
    }

    @Test
    public void isbnWithoutCheckDigitAndDashes() {
        assertFalse(IsbnVerifier.isValid("359821507"));
    }

    @Test
    public void tooLongIsbnAndNoDashes() {
        assertFalse(IsbnVerifier.isValid("3598215078X"));
    }

    @Test
    public void tooShortIsbn() {
        assertFalse(IsbnVerifier.isValid("00"));
    }

    @Test
    public void isbnWithoutCheckDigit() {
        assertFalse(IsbnVerifier.isValid("3-598-21507"));
    }

    @Test
    public void checkDigitOfXShouldNotBeUsedForZero() {
        assertFalse(IsbnVerifier.isValid("3-598-21515-X"));
    }

    @Test
    public void emptyIsbn() {
        assertFalse(IsbnVerifier.isValid(""));
    }

    @Test
    public void inputIsNineCharacters() {
        assertFalse(IsbnVerifier.isValid("134456729"));
    }

    @Test
    public void invalidCharactersAreNotIgnored() {
        assertFalse(IsbnVerifier.isValid("3132P34035"));
    }

    @Test
    public void inputIsTooLongButContainsAValidIsbn() {
        assertFalse(IsbnVerifier.isValid("98245726788"));
    }
}
