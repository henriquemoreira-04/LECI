import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.format.DateTimeFormatter;
import java.util.*;

public class ContactManager {
    private final Map<Integer, Contact> contacts;
    private final StandardCostCalculator costCalculator;
    
    public ContactManager() {
        this.contacts = new HashMap<>();
        this.costCalculator = new StandardCostCalculator();
    }
    
    public void addContact(Contact c) {
        if (c != null && !contacts.containsKey(c.getId())) {
            contacts.put(c.getId(), c);
        }
    }
    
    public void removeContact(int id) {
        contacts.remove(id);
    }
    
    public Contact getContact(int id) {
        return contacts.get(id);
    }
    
    public double calculateContactCost(int id) {
        Contact contact = getContact(id);
        if (contact == null) {
            return -1;
        }
        
        double callCost = costCalculator.calculateCost(
            contact.getCallMinutes(), 
            IContactCostCalculator.ContactType.CELLNUMBER);
        
        double emailCost = costCalculator.calculateCost(
            contact.getEmailsSent(), 
            IContactCostCalculator.ContactType.EMAIL);
        
        return callCost + emailCost;
    }
    
    public void printAllContacts() {
        if (contacts.isEmpty()) {
            System.out.println("No contacts available.");
            return;
        }
        
        System.out.println("List of Contacts:");
        for (Contact contact : contacts.values()) {
            System.out.println(contact);
            System.out.printf("  Total cost: %.2f€\n", calculateContactCost(contact.getId()));
        }
    }
    
    public void readFile(String file) {
        try {
            List<String> lines = Files.readAllLines(Paths.get(file));
            for (String line : lines) {
                String[] parts = line.split(";");
                if (parts.length >= 4) {
                    Contact c = new Contact(
                        parts[0].trim(), 
                        Integer.parseInt(parts[1].trim()), 
                        parts[2].trim(), 
                        parts[3].trim());
                    addContact(c);
                }
            }
        } catch (IOException e) {
            System.err.println("Error reading file: " + e.getMessage());
        }
    }
    
    public void writeFile(String file) {
        try (PrintWriter writer = new PrintWriter(new FileWriter(file))) {
            for (Contact contact : contacts.values()) {
                writer.printf("%s;%d;%s;%s%n",
                    contact.getName(),
                    contact.getPhoneNumber(),
                    contact.getEmail(),
                    contact.getBirthDate().format(DateTimeFormatter.ISO_LOCAL_DATE));
            }
        } catch (IOException e) {
            System.err.println("Error writing file: " + e.getMessage());
        }
    }
}
