public class MainClass {
    public static void main(String[] args) {
        FinancialForecast f = new FinancialForecast();

        double presentVal = 100000;
        double growthRate = 0.1;
        int years = 10;

        double res = f.forecast(presentVal, growthRate, years);
        System.out.println();
        System.out.printf("Future Value after %d years: %.2f", years, res);
        System.out.println();
        System.out.println();
    }
}
