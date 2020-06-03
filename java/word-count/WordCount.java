import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class WordCount {
    Map<String, Integer> phrase(String phrase) {
        HashMap<String, Integer> counter = new HashMap<>();
        Scanner scanner = new Scanner(phrase.toLowerCase());

        scanner.useDelimiter("[\\s,!@$#%%^&:\\.]+");

        while (scanner.hasNext()) {
            String word = scanner.next();
            char beginning = word.charAt(0);
            if (beginning == word.charAt(word.length() - 1) &&
                    (beginning == '"' || beginning == '\'')) {
                word = word.substring(1, word.length() - 1);
            }
            counter.merge(word, 1, Integer::sum);
        }


        return counter;
    }
}
