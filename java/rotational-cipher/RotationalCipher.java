class RotationalCipher {
    private int key;

    RotationalCipher(int shiftKey) {
        key = shiftKey;
    }

    String rotate(String data) {
        StringBuilder ciphertext = new StringBuilder();
        for (char p: data.toCharArray()) {
            if (Character.isLetter(p)) {
                char offset = Character.isUpperCase(p) ? 'A' : 'a';
                ciphertext.append((char) ((p - offset + key) % 26 + offset));
            }
            else {
                ciphertext.append(p);
            }
        }
        return ciphertext.toString();
    }

}
