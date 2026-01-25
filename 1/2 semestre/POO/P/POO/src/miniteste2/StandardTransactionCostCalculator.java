import java.time.DayOfWeek;

public class StandardTransactionCostCalculator implements ITransactionCostCalculator {
    @Override
    public double calculateTransactionCost(Transaction t) {
        double baseCost = t.getHoursWorked() * 50;
        
        DayOfWeek day = t.getServiceDateTime().getDayOfWeek();
        
        
        if (day == DayOfWeek.SATURDAY || day == DayOfWeek.SUNDAY) {
            baseCost *= 2;
        }
        
        
        if (day == DayOfWeek.WEDNESDAY) {
            baseCost *= 0.9;
        }
        
        return baseCost;
    }
}