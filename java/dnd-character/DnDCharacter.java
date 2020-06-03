import java.util.Random;

class DnDCharacter {

    int strength;
    int dexterity;
    int constitution;
    int intelligence;
    int wisdom;
    int charisma;

    private Random randomProvider = new Random();

    int ability() {
        throw new UnsupportedOperationException("Delete this statement and write your own implementation.");
    }

    int modifier(int input) {
        throw new UnsupportedOperationException("Delete this statement and write your own implementation.");
    }

    int getStrength() { return strength; }
    int getDexterity() { return dexterity; }
    int getConstitution() { return constitution; }
    int getIntelligence() { return intelligence; }
    int getWisdom() { return wisdom; }
    int getCharisma() { return charisma; }

    int getHitpoints() {
        throw new UnsupportedOperationException("Delete this statement and write your own implementation.");
    }

    private int[] rollFourDice() {
        return randomProvider.ints(4).toArray();
    }

}
