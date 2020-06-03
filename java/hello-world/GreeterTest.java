import static org.junit.Assert.assertEquals;

public class GreeterTest {

    @org.junit.Test
    public void testThatGreeterReturnsTheCorrectGreeting() {
        assertEquals("Hello, World!", Greeter.getGreeting());
    }

}
