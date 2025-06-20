public class Logger {

    private static Logger instance;

    private Logger() {
        // Initialize resources here if needed
    }

    // to get the single instance of the class
    public static Logger getInstance() {
        if (instance == null) {
            synchronized (Logger.class) {
                if (instance == null) {
                    instance = new Logger();
                }
            }
        }
        return instance;
    }

    // Example
    public void log(String message) {
        System.out.println("Log: " + message);
    }
}