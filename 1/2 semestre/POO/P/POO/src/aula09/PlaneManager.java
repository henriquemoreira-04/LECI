package aula09;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PlaneManager {
    private Map<String, Plane> planes;

    public PlaneManager() {
        this.planes = new HashMap<>();
    }

    public void addPlane(Plane plane) {
        planes.put(plane.getId(), plane);
    }

    public void removePlane(String id) {
        planes.remove(id);
    }

    public Plane searchPlane(String id) {
        return planes.get(id);
    }

    public List<CommercialPlane> getCommercialPlanes() {
        List<CommercialPlane> commercialPlanes = new ArrayList<>();
        for (Plane plane : planes.values()) {
            if (plane instanceof CommercialPlane) {
                commercialPlanes.add((CommercialPlane) plane);
            }
        }
        return commercialPlanes;
    }

    public List<MilitaryPlane> getMilitaryPlanes() {
        List<MilitaryPlane> militaryPlanes = new ArrayList<>();
        for (Plane plane : planes.values()) {
            if (plane instanceof MilitaryPlane) {
                militaryPlanes.add((MilitaryPlane) plane);
            }
        }
        return militaryPlanes;
    }

    public void printAllPlanes() {
        for (Plane plane : planes.values()) {
            System.out.println(plane);
            System.out.println("-------------------");
        }
    }

    public Plane getFastestPlane() {
        Plane fastest = null;
        for (Plane plane : planes.values()) {
            if (fastest == null || plane.getMaxSpeed() > fastest.getMaxSpeed()) {
                fastest = plane;
            }
        }
        return fastest;
    }
}
