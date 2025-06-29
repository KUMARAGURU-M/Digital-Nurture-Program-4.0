package org.example;
import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;

class CalculatorTest {

    private Calculator calculator;

    // Setup method: runs before each test
    @BeforeEach
    void setUp() {
        calculator = new Calculator();
        System.out.println("Setup: Calculator instance created");
    }

    // Teardown method: runs after each test
    @AfterEach
    void tearDown() {
        calculator = null;
        System.out.println("Teardown: Calculator instance cleaned up");
    }

    @Test
    void testAddition() {
        // Arrange
        int a = 5;
        int b = 3;

        // Act
        int result = calculator.add(a, b);

        // Assert
        assertEquals(8, result);
    }

    @Test
    void testSubtraction() {
        // Arrange
        int a = 10;
        int b = 4;

        // Act
        int result = calculator.subtract(a, b);

        // Assert
        assertEquals(6, result);
    }

    @Test
    void testMultiplication() {
        // Arrange
        int a = 6;
        int b = 7;

        // Act
        int result = calculator.multiply(a, b);

        // Assert
        assertEquals(42, result);
    }

    @Test
    void testDivision() {
        // Arrange
        int a = 20;
        int b = 5;

        // Act
        int result = calculator.divide(a, b);

        // Assert
        assertEquals(4, result);
    }

    @Test
    void testDivisionByZeroThrowsException() {
        // Arrange
        int a = 10;
        int b = 0;

        // Act & Assert
        assertThrows(IllegalArgumentException.class, () -> calculator.divide(a, b));
    }
}
