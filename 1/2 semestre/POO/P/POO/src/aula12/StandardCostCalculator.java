public class StandardCostCalculator implements IContactCostCalculator {
    @Override
    public double calculateCost(double units, ContactType type) {
        switch(type) {
            case EMAIL:
                return 0 * units; 
            case CELLNUMBER:
                return 0.10 * units; 
            default:
                return 0;
        }
    }
}
