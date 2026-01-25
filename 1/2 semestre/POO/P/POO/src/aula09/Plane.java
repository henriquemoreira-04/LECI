package aula09;

public class Plane {
    private String id;
    private String manufacturer;
    private String model;
    private int year;
    private int maxPassengers;
    private int maxSpeed;

    public Plane(String id, String manufacturer, String model, int year, int maxPassengers, int maxSpeed) {
        this.id = id;
        this.manufacturer = manufacturer;
        this.model = model;
        this.year = year;
        this.maxPassengers = maxPassengers;
        this.maxSpeed = maxSpeed;
    }

    public String getId() {
        return id;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public String getModel() {
        return model;
    }

    public int getYear() {
        return year;
    }

    public int getMaxPassengers() {
        return maxPassengers;
    }

    public int getMaxSpeed() {
        return maxSpeed;
    }

    public String getPlaneType() {
        return "Genérico";
    }

    @Override
    public String toString() {
        return String.format(
            "ID: %s\nFabricante: %s\nModelo: %s\nAno: %d\nPassageiros: %d\nVelocidade Máxima: %d km/h\nTipo: %s",
            id, manufacturer, model, year, maxPassengers, maxSpeed, getPlaneType()
        );
    }
}
