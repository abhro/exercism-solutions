import static org.junit.Assert.assertEquals;

public class DoublyLinkedListTest {

    @org.junit.Test
    public void testPushPop() {
        DoublyLinkedList<Integer> list = new DoublyLinkedList<>();

        list.push(10);
        list.push(20);
        list.push(30);

        assertEquals(list.pop().intValue(), 30);
        assertEquals(list.pop().intValue(), 20);
        assertEquals(list.pop().intValue(), 10);
    }

    @org.junit.Test
    public void testPushShift() {
        DoublyLinkedList<String> list = new DoublyLinkedList<>();

        list.push("10");
        list.push("20");
        list.push("30");

        assertEquals(list.shift(), "10");
        assertEquals(list.shift(), "20");
        assertEquals(list.shift(), "30");
    }

    @org.junit.Test
    public void testUnshiftShift() {
        DoublyLinkedList<Character> list = new DoublyLinkedList<>();

        list.unshift('1');
        list.unshift('2');
        list.unshift('3');

        assertEquals(list.shift().charValue(), '3');
        assertEquals(list.shift().charValue(), '2');
        assertEquals(list.shift().charValue(), '1');
    }

    @org.junit.Test
    public void testUnshiftPop() {
        DoublyLinkedList<Integer> list = new DoublyLinkedList<>();

        list.unshift(10);
        list.unshift(20);
        list.unshift(30);

        assertEquals(list.pop().intValue(), 10);
        assertEquals(list.pop().intValue(), 20);
        assertEquals(list.pop().intValue(), 30);
    }

    @org.junit.Test
    public void testExample() {
        DoublyLinkedList<String> list = new DoublyLinkedList<>();

        list.push("ten");
        list.push("twenty");

        assertEquals(list.pop(), "twenty");

        list.push("thirty");

        assertEquals(list.shift(), "ten");

        list.unshift("forty");
        list.push("fifty");

        assertEquals(list.shift(), "forty");
        assertEquals(list.pop(), "fifty");
        assertEquals(list.shift(), "thirty");
    }

}
