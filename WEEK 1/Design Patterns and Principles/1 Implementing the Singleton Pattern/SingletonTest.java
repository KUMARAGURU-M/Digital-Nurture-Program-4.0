public class SingletonTest {
    public static void main(String[] args) {
        // Get single instance
        Logger logger1 = Logger.getInstance();
        Logger logger2 = Logger.getInstance();

        System.out.println();

        // Check for references point
        if (logger1 == logger2) {
            System.out.println("Same Logger instances");
        } else {
            System.out.println("Different Logger instances");
        }

        // Test logging
        logger1.log("test log message.");
        logger2.log("another test log message.");
    }
}
