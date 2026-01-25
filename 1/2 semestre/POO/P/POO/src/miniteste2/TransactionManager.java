import java.io.*;
import java.time.format.*;
import java.util.*;


public class TransactionManager {
    private Map<Integer, Transaction> transactions;
    private ITransactionCostCalculator costCalculator;

    public TransactionManager() {
        this.transactions = new HashMap<>();
        this.costCalculator = new StandardTransactionCostCalculator();
    }

    public void addTransaction(Transaction t) {
        transactions.put(t.getId(), t);
    }

    public boolean removeTransaction(int id) {
        return transactions.remove(id) != null;
    }

    public Transaction getTransaction(int id) {
        return transactions.get(id);
    }

    public double calculateTransactionCost(int id) {
        Transaction t = transactions.get(id);
        return t != null ? costCalculator.calculateTransactionCost(t) : -1;
    }

    public void printAllTransactions() {
        transactions.values().forEach(System.out::println);
    }

    public void sortTransactionsByCost() {
        transactions.values().stream()
            .sorted(Comparator
                .comparing((Transaction t) -> t.getServiceDateTime().getDayOfWeek())
                .thenComparingDouble(t -> -calculateTransactionCost(t.getId())))
            .forEach(t -> System.out.println(t + " - Cost: " + calculateTransactionCost(t.getId())));
    }

    public void readFile(String filename) {
        try (BufferedReader br = new BufferedReader(new FileReader(filename))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 4) {
                    int id = Integer.parseInt(parts[0].trim());
                    double hours = Double.parseDouble(parts[1].trim());
                    String desc = parts[2].trim();
                    String date = parts[3].trim();
                    
                    Transaction t = new Transaction(id, desc, date, hours);
                    transactions.put(id, t);
                }
            }
        } catch (IOException e) {
            System.err.println("Error encontrando el fichero: " + e.getMessage());
        }
    }

    public void writeFile(String filename) {
        try (PrintWriter pw = new PrintWriter(new FileWriter(filename))) {
            for (Transaction t : transactions.values()) {
                double cost = calculateTransactionCost(t.getId());
                pw.printf("%d, %.2f, %s, %s, %.2f%n", 
                    t.getId(), 
                    t.getHoursWorked(), 
                    t.getServiceDescription(), 
                    t.getServiceDateTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")), 
                    cost);
            }
        } catch (IOException e) {
            System.err.println("Error writing file: " + e.getMessage());
        }
    }
}