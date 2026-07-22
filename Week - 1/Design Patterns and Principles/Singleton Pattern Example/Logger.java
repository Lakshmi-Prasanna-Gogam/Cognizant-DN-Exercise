public class Logger {
    private static Logger instance;

    private Logger() {
        System.out.println("This is Logger class.");
    }

    public static Logger getInstance() {
        if (instance == null)
            instance = new Logger();
        return instance;
    }
}
