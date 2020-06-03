class IsbnVerifier {
    static boolean isValid(String isbn) {
        isbn = isbn.replace("-", "");
        if (isbn.length() != 10) {
            return false;
        }
        int sum = 0;
        for (int i = 0; i < isbn.length(); i++) {
            sum += Byte.parseByte(isbn.substring(i, i + 1)) * (10 - i);
        }
        return sum % Byte.parseByte(isbn.substring(10, 11)) == 0;
    }
}
