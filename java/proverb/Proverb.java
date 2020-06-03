class Proverb {

    private static final String paragraphTemplate =
        "For want of a %s the %s was lost.\n";
    private static final String finalTemplate = "And all for the want of a %s.";

    private String[] words;

    Proverb(String[] words) {
        this.words = words;
    }

    String recite() {
        if (words.length == 1) {
            return String.format(finalTemplate, words[0]);
        }

        StringBuilder sBuilder = new StringBuilder();

        for (int i = 0; i < words.length; i++) {
            if (i + 1 == words.length) {
                sBuilder.append(String.format(finalTemplate, words[0]));
                break;
            }
            sBuilder.append(String.format(paragraphTemplate, words[i], words[i+1]));
        }

        return sBuilder.toString();
    }

}
