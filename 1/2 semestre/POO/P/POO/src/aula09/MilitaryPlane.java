package aula09;

public class MilitaryPlane extends Plane {
    private int ammoCount;

    public MilitaryPlane(String id, String manufacturer, String model, int year, 
                        int maxPassengers, int maxSpeed, int ammoCount) {
        super(id, manufacturer, model, year, maxPassengers, maxSpeed);
        this.ammoCount = ammoCount;
    }

    public int getAmmoCount() {
        return ammoCount;
    }

    @Override
    public String getPlaneType() {
        return "Militar";
    }

    @Override
    public String toString() {
        return super.toString() + "\nMunição: " + ammoCount;
    }
}
