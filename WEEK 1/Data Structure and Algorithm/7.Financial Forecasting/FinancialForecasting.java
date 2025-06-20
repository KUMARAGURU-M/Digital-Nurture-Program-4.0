import java.util.*;

public class FinancialForecasting {

    private static Map<Integer, Double> map = new HashMap<>();

    // Recursive method with memoization
    public static double calculateFutureValue(double initialAmount, double growthRate, int timePeriod) {
        if (map.containsKey(timePeriod)) {
            return map.get(timePeriod);
        }

        // Base case: No more years to calculate
        if (timePeriod == 0) {
            return initialAmount;
        }

        // Recursive case with memoization
        double computedValue = calculateFutureValue(initialAmount * (1 + growthRate), growthRate, timePeriod - 1);
        map.put(timePeriod, computedValue);
        return computedValue;
    }

    public static void main(String[] args) {
        Scanner inputScanner = new Scanner(System.in);

        System.out.println();
        // Input from user
        System.out.print("Enter the initial amount: ");
        double initialAmount = inputScanner.nextDouble();

        System.out.print("Enter the annual growth rate (as a decimal): ");
        double annualGrowthRate = inputScanner.nextDouble();

        System.out.print("Enter the number of years: ");
        int numberOfYears = inputScanner.nextInt();

        double projectedValue = calculateFutureValue(initialAmount, annualGrowthRate, numberOfYears);
        System.out.printf("Future Value : %.2f%n", projectedValue);

        inputScanner.close();
    }
}
