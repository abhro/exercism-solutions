import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class NucleotideCounter {
    static Pattern ILLEGAL_MOLECULES = Pattern.compile("([^ACGT])");

    HashMap<Character, Integer> counter = new HashMap<>(Map.of(
        'A', 0, 'G', 0, 'C', 0, 'T', 0));
    boolean proteinsCounted = false; // rudimentary caching
    final String nucleotides; // not nucleotide-string like java string

    public NucleotideCounter(String nucleotides) {
        nucleotides = nucleotides.strip().toUpperCase();

        Matcher matcher = ILLEGAL_MOLECULES.matcher(nucleotides);
        if (matcher.find()) { // if nucleotides has non AGCT tokens
            throw new IllegalArgumentException(String.format(
                "Illegal nucleotide %s", matcher.group()));
        }

        this.nucleotides = nucleotides;
    }

    public Map<Character, Integer> nucleotideCounts() {
        if (proteinsCounted) {
            return counter;
        }

        for (char c: nucleotides.toCharArray()) {
            counter.merge(c, 1, Integer::sum); // increment nucleotide count
        }

        proteinsCounted = true;
        return counter;
    }
}
