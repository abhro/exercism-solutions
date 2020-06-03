import org.junit.Test;
import org.junit.Before;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertNotEquals;

public class RobotTest {

    private static final String EXPECTED_ROBOT_NAME_PATTERN = "[A-Z]{2}\\d{3}";
    private Robot robot;

    @Before
    public void setUp() {
        robot = new Robot();
    }

    @Test
    public void hasName() {
        assertIsValidName(robot.getName());
    }

    @Test
    public void differentRobotsHaveDifferentNames() {
        assertNotEquals(robot.getName(), new Robot().getName());
    }

    @Test
    public void resetName() {
        final String name = robot.getName();
        robot.reset();
        final String name2 = robot.getName();
        assertNotEquals(name, name2);
        assertIsValidName(name2);
    }

    private static void assertIsValidName(String name) {
        assertTrue(name.matches(EXPECTED_ROBOT_NAME_PATTERN));
    }
}
