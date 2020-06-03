import java.util.ArrayList;
import java.util.List;

public class Allergies {
    private int score;

    public Allergies(int score) {
        this.score = score;
    }

    public boolean isAllergicTo(Allergen allergen) {
        return (score & allergen.getScore()) != 0;
    }

    public List<Allergen> getList() {
        ArrayList<Allergen> allergens = new ArrayList<>();

        for (Allergen allergen: Allergen.values()) {
            if ((score & allergen.getScore()) != 0) {
                allergens.add(allergen);
            }
        }

        return allergens;
    }
}
