import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Contact {
    private static int nextId = 1;
    
    private final int id;
    private String name;
    private int phoneNumber;
    private String email;
    private LocalDate birthDate;
    private double callMinutes;
    private int emailsSent;
    
    public Contact(String name, int phoneNumber, String email, String birthDate) {
        this.id = nextId++;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.birthDate = LocalDate.parse(birthDate);
        this.callMinutes = 0;
        this.emailsSent = 0;
    }
    
    // Getters y Setters
    public int getId() { return id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public int getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(int phoneNumber) { this.phoneNumber = phoneNumber; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public LocalDate getBirthDate() { return birthDate; }
    public void setBirthDate(String birthDate) { this.birthDate = LocalDate.parse(birthDate); }
    public double getCallMinutes() { return callMinutes; }
    public int getEmailsSent() { return emailsSent; }
    
    // Métodos para registrar contactos
    public void call(double duration) {
        this.callMinutes += duration;
    }
    
    public void email() {
        this.emailsSent++;
    }
    
    @Override
    public String toString() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        return String.format("Contact [id=%d, name=%s, phoneNumber=%d, email=%s, birthDate=%s, calls=%.1f min, emails=%d]", 
                            id, name, phoneNumber, email, birthDate.format(formatter), callMinutes, emailsSent);
    }
    
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        Contact contact = (Contact) obj;
        return id == contact.id;
    }
    
    @Override
    public int hashCode() {
        return id;
    }
}
