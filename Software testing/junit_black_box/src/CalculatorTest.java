public class CalculatorTest extends junit.framework.TestCase {

    public void testAddingTwoPositiveIntegers() throws Exception {
        int expected = 11;
        int actual = new Calculator().add(4, 7);
        assertEquals(expected, actual);
    }

    public void testAddingTwoNegativeIntegers() throws Exception {
        int expected = -11;
        int actual = new Calculator().add(-4, -7);
        assertEquals(expected, actual);
    }

    public void testAddingNegativeIntegerToPositiveInteger() throws Exception {
        int expected = -3;
        int actual = new Calculator().add(4, -7);
        assertEquals(expected, actual);
    }
}