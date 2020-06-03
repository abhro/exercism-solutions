import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class Bob {
    public String hey(String what) {
        what = what.strip();
        if (what.isEmpty()) {
            return "Fine. Be that way!";
        }
        Matcher matcher = Pattern.compile("[A-Za-z]").matcher(what);
        if (what.endsWith("?")) {
            if (matcher.find() && what.equals(what.toUpperCase())) {
                return "Calm down, I know what I'm doing!";
            }
            return "Sure.";
        }
        if (matcher.find() && what.equals(what.toUpperCase())) {
            return "Whoa, chill out!";
        }
        return "Whatever.";
    }
}
