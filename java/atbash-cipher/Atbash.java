public class Atbash {
    public static String encode(String plaintext) {
        StringBuilder ciphertext = new StringBuilder(plaintext.length());

        int spacesAdded = 0;
        for (char c: plaintext.toLowerCase().toCharArray()) {
            if ('a' <= c && c <= 'z') {
                ciphertext.append((char) ('a' + 'z' - c));
            }
            else if ('0' <= c && c <= '9') {
                ciphertext.append(c);
            }

            // break into blocks of size 5
            if (ciphertext.length() % 5 == spacesAdded % 5) {
                // introduces a bug  here  later fixed ↑ with String.replaceAll
                ciphertext.append(' ');
                spacesAdded++;
            }
        }

        return ciphertext.toString().trim().replaceAll("\\s+", " ");
    }

    public static String decode(String ciphertext) {
        StringBuilder plaintext = new StringBuilder(ciphertext.length());

        for (char c: ciphertext.toLowerCase().toCharArray()) {
            if ('a' <= c && c <= 'z') {
                plaintext.append((char) ('a' + 'z' - c));
            }
            else if ('0' <= c && c <= '9') {
                plaintext.append(c);
            }
        }

        return plaintext.toString();
    }
}
