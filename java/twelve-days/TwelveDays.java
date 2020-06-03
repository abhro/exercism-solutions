import java.util.List;
import static java.util.Arrays.asList;
import static java.util.Arrays.copyOfRange;
import static java.util.Collections.reverse;

class TwelveDays {
    static String[] ORDINALS = {
        "zeroth", "first", "second", "third", "fourth", "fifth", "sixth",
        "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"};
    static String[] GIFTS = {
        null,
        "a Partridge in a Pear Tree", "two Turtle Doves",
        "three French Hens", "four Calling Birds",
        "five Gold Rings", "six Geese-a-Laying",
        "seven Swans-a-Swimming", "eight Maids-a-Milking",
        "nine Ladies Dancing", "ten Lords-a-Leaping",
        "eleven Pipers Piping", "twelve Drummers Drumming"
    };
    static String RECEPTION = "On the %s day of Christmas my true love gave to me: %s.";

    /** @return The verse singing about the gifts for one day */
    String verse(int verseNumber) {
        return String.format(RECEPTION, ORDINALS[verseNumber], gifts(verseNumber)) + "\n";
    }

    String verses(int startVerse, int endVerse) {
        StringBuilder builder = new StringBuilder();
        for (int verseNumber = startVerse; verseNumber <= endVerse; verseNumber++) {
            builder.append(verse(verseNumber) + "\n");
        }
        builder.deleteCharAt(builder.length() - 1); // remove final extra LF
        return builder.toString();
    }

    String sing() {
        return verses(1, 12);
    }

    /** @return The formatted gifts singing for one day */
    private String gifts(int day) {
        List<String> presents = asList(copyOfRange(GIFTS, 1, day + 1));
        reverse(presents);
        String[] gifts = presents.toArray(new String[presents.size()]);
        return gifts.length > 1 ? String.format(
            "%s, and %s",
            String.join(", ", copyOfRange(gifts, 0, gifts.length - 1)),
            gifts[gifts.length - 1]) : gifts[0];
    }
}
