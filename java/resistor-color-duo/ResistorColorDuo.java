class ResistorColorDuo {
    private enum Colors {
        black, brown, red, orange, yellow, green, blue, violet, grey, white
    }

    int value(String[] colors) {
        int resistor_1 = Colors.valueOf(colors[0]).ordinal();
        int resistor_2 = Colors.valueOf(colors[1]).ordinal();

        return resistor_1 * 10 + resistor_2;
    }
}
