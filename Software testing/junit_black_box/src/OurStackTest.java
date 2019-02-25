import java.util.LinkedList;

public class OurStackTest extends junit.framework.TestCase{
    public void testCheckEmpty() throws Exception {
        boolean expected = true;
        OurStack<Integer> ourStack = new OurStack<>();
        ourStack.push(1);
        ourStack.push(2);
        ourStack.makeEmpty();
        boolean actual = ourStack.isEmpty();
        assertEquals(expected, actual);
    }

    public void testPushPop() throws Exception {
        String expected = "ding";
        OurStack<String> stack = new OurStack<>();
        stack.push("one");
        stack.push("two");
        stack.pop();
        stack.push("ding");
        stack.push("wololo");
        stack.pop();
        String actual = (String) stack.top();
        assertEquals(expected, actual);
    }

    public void testSize() throws Exception{
        int expected = 3;
        OurStack<String> stack = new OurStack<>();
        stack.push("o");
        stack.push("one");
        stack.push("two");
        int actual = stack.size();
        assertEquals(expected, actual);
    }
    public void testMakeEmpty() throws Exception{
        boolean expected = true;
        OurStack<String> stack = new OurStack<>();
        stack.push("o");
        stack.push("one");
        stack.push("two");
        stack.makeEmpty();
        boolean actual = stack.isEmpty();
        assertEquals(expected, actual);
    }

    public void testExcessivePop() throws Exception{
        int expected = 0;
        OurStack<String> stack = new OurStack<>();
        stack.pop();
        stack.pop();
        stack.pop();
        stack.pop();
        int actual = stack.size();
        assertEquals(expected, actual);
    }

    public void testMaxSize() throws Exception {
        int expected = 1000000;
        OurStack<String> stack = new OurStack<>();
        for (int i = 0; i<expected; i++) {
            stack.push(":D");
        }
        int actual = stack.size();
        assertEquals(expected, actual);
    }

    public void testIsEmpty0() throws Exception {
        Boolean expected = true;
        Boolean actual = new OurStack<>().isEmpty();
        assertEquals(expected, actual);
    }

    public void testIsEmpty1() throws Exception {
        Boolean expected = true;
        OurStack<String> stack = new OurStack<>();
        stack.push("something");
        stack.pop();
        Boolean actual = stack.isEmpty();
        assertEquals(expected, actual);
    }

    public void testIsEmpty2() throws Exception {
        Boolean expected = false;
        OurStack<String> stack = new OurStack<>();
        stack.push("something");
        Boolean actual = stack.isEmpty();
        assertEquals(expected, actual);
    }

}
