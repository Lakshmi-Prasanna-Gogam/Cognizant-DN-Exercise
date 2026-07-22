public class FinancialForecast {
    public double forecast(double presentVal, double growthRate, int years) {
        if (years == 0)
            return presentVal;
        return forecast(presentVal, growthRate, years - 1) * (1 + growthRate);
    }
}