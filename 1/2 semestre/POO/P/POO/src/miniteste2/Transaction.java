import java.time.*;
import java.time.format.*;

public class Transaction{
    private static int nextId = 1;
    private int id;
    private double hoursWorked;
    private String serviceDescription;
    private LocalDateTime serviceDateTime;

    public Transaction(String serviceDescription, String dateTime, double hoursWorked) {
        this.id = nextId++;
        this.serviceDescription = serviceDescription;
        this.hoursWorked = hoursWorked;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        this.serviceDateTime = LocalDateTime.parse(dateTime, formatter);
    }

    public Transaction(int id, String serviceDescription, String dateTime, double hoursWorked) {
        this.id = id;
        this.serviceDescription = serviceDescription;
        this.hoursWorked = hoursWorked;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        this.serviceDateTime = LocalDateTime.parse(dateTime, formatter);
        if (id >= nextId) {
            nextId = id + 1;
        }
    }

    public int getId() { return id; }
    public double getHoursWorked() { return hoursWorked; }
    public String getServiceDescription() { return serviceDescription; }
    public LocalDateTime getServiceDateTime() { return serviceDateTime; }

    public void setHoursWorked(double hoursWorked) { this.hoursWorked = hoursWorked; }
    public void setServiceDescription(String serviceDescription) { this.serviceDescription = serviceDescription; }
    public void setServiceDateTime(LocalDateTime serviceDateTime) { this.serviceDateTime = serviceDateTime; }

    @Override
    public String toString() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        return "Transaction [id=" + id + ", hoursWorked=" + hoursWorked + 
               ", serviceDescription=" + serviceDescription + 
               ", serviceDateTime=" + serviceDateTime.format(formatter) + "]";
    }
}
