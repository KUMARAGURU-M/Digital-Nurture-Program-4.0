package org.example;

import org.junit.Test;
import static org.junit.Assert.*;

public class AdderTest {
    @Test
    public void testAdd() {
        Adder a = new Adder();
        int result = a.add(3, 4);
        System.out.println("Result: " + result);
        assertEquals(7, result);
    }
}
