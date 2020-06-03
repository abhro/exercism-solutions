import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

class HandshakeCalculator {

    final static HashMap<Signal, Integer> CODE_TABLE = new HashMap<>();
    static {
        CODE_TABLE.put(Signal.WINK, 1);
        CODE_TABLE.put(Signal.DOUBLE_BLINK, 2);
        CODE_TABLE.put(Signal.CLOSE_YOUR_EYES, 4);
        CODE_TABLE.put(Signal.JUMP, 8);
    }

    List<Signal> calculateHandshake(int number) {
        ArrayList<Signal> instructions = new ArrayList<>();
        for (Signal key: CODE_TABLE.keySet()) {
            if ((number & CODE_TABLE.get(key)) != 0) {
                instructions.add(key);
            }
        }
        instructions.sort(new Comparator<Signal>() { // could've been a goddamn key function
            @Override
            public int compare(Signal sig1, Signal sig2) {
                return sig1.compareTo(sig2);
            }
        });
        if ((number & 16) != 0) {
            Collections.reverse(instructions);
        }
        return instructions;
    }

}
