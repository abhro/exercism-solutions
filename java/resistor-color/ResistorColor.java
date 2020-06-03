import java.util.Arrays;
import java.util.LinkedHashMap;

class ResistorColor {
    static LinkedHashMap<String, Integer> color_codes = new LinkedHashMap<String, Integer>();
    static {
        color_codes.put("black", 0);
        color_codes.put("brown", 1);
        color_codes.put("red", 2);
        color_codes.put("orange", 3);
        color_codes.put("yellow", 4);
        color_codes.put("green", 5);
        color_codes.put("blue", 6);
        color_codes.put("violet", 7);
        color_codes.put("grey", 8);
        color_codes.put("white", 9);
    }

    int colorCode(String color) {
        return color_codes.get(color);
    }

    String[] colors() {
        return Arrays.copyOf(color_codes.keySet().toArray(), color_codes.size(), String[].class);
    }
}
