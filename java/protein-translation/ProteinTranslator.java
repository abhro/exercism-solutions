import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.HashMap;
import java.util.function.Consumer;
import java.util.regex.MatchResult;

class ProteinTranslator {

    static HashMap<String, String> codonToProtein = new HashMap<>();
    static {
        codonToProtein.put("AUG",  "Methionine");
        codonToProtein.put("UUU",  "Phenylalanine");
        codonToProtein.put("UUC",  "Phenylalanine");
        codonToProtein.put("UUA",  "Leucine");
        codonToProtein.put("UUG",  "Leucine");
        codonToProtein.put("UCU",  "Serine");
        codonToProtein.put("UCC",  "Serine");
        codonToProtein.put("UCA",  "Serine");
        codonToProtein.put("UCG",  "Serine");
        codonToProtein.put("UAU",  "Tyrosine");
        codonToProtein.put("UAC",  "Tyrosine");
        codonToProtein.put("UGU",  "Cysteine");
        codonToProtein.put("UGC",  "Cysteine");
        codonToProtein.put("UGG",  "Tryptophan");
    }

    List<String> translate(String rnaSequence) {
        Scanner scanner = new Scanner(rnaSequence);
        ArrayList<String> proteins = new ArrayList<>();
        scanner.findAll("[AUGC]{3}").forEach(new Consumer<MatchResult>() {
            @Override
            public void accept(MatchResult result) {
                proteins.add(codonToProtein.get(result.group(0)));
            }

            @Override
            public Consumer<MatchResult> andThen(Consumer<? super MatchResult> after) {
                return null; // no-op
            }
        });

        return proteins;
    }
}
