package aula09;

public class CommercialPlane extends Plane {
    private int crewMembers;

    public CommercialPlane(String id, String manufacturer, String model, int year, 
                          int maxPassengers, int maxSpeed, int crewMembers) {
        super(id, manufacturer, model, year, maxPassengers, maxSpeed);
        this.crewMembers = crewMembers;
    }

    public int getCrewMembers() {
        return crewMembers;
    }

    @Override
    public String getPlaneType() {
        return "Comercial";
    }

    @Override
    public String toString() {
        return super.toString() + "\nTripulação: " + crewMembers;
    }
}
