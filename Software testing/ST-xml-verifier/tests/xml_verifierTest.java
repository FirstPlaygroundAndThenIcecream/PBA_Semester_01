import org.junit.Test;

import static org.junit.Assert.*;

public class xml_verifierTest {
    private xml_verifier xmlVerifier = new xml_verifier("verifier");

    @Test
    public void getName() {
        assertEquals("verifier", xmlVerifier.getName());
    }

    @Test
    public void verifyClosingTag() throws Exception{
        String test_string = "<p>This is a paragraph.</p>";
        boolean actual = xmlVerifier.verifyClosingTag(test_string);
        assertTrue(test_string, actual);
    }
}