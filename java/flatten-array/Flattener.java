import java.util.ArrayList;
import java.util.List;

public class Flattener {
    public static List<Object> flatten(List<Object> nested) {
        List<Object> flattened = new ArrayList<>();

        for (Object elem: nested) {
            if (elem == null) {
                continue;
            }

            if (elem instanceof List) {
                @SuppressWarnings("unchecked")
                List<Object> innerNested = (List<Object>) elem;
                flattened.addAll(flatten(innerNested));
            }
            else {
                flattened.add(elem);
            }
        }

        return flattened;
    }
}
