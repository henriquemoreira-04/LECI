package aula11;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.stream.Collectors;

public class EnergyUsageReport {
    private final LinkedList<Customer> customers = new LinkedList<>();

    public void load(String file) {
        LinkedList<String> lines;
        Path path = Paths.get(file);
        try {
            lines = new LinkedList<>(Files.readAllLines(path));
        } catch (IOException e) {
            System.out.printf("Error al cargar el archivo \"%s\". Asegúrese de que el archivo esté en la ruta especificada.", path);
            System.exit(1);
            return;
        }

        for (String line : lines) {
            String[] data = line.split("\\|");
            int customerId = Integer.parseInt(data[0]);
            LinkedList<Double> meterReadings = Arrays.stream(data).skip(1).map(Double::parseDouble).collect(Collectors.toCollection(LinkedList::new));
            customers.add(new Customer(customerId, meterReadings));
        }
    }

    public void addCustomer(Customer newCustomer) {
        customers.add(newCustomer);
    }

    public void removeCustomer(int id) {
        customers.removeIf(customer -> customer.getCustomerId() == id);
    }

    public Customer getCustomer(int id) {
        return customers.stream().filter(customer -> customer.getCustomerId() == id).findFirst().orElse(null);
    }

    public double calculateTotalUsage(int id) {
        return customers.stream()
                .filter(customer -> customer.getCustomerId() == id)
                .findFirst()
                .map(Customer::getMeterReadings)
                .orElse(new LinkedList<>())
                .stream()
                .mapToDouble(Double::doubleValue)
                .sum();
    }

    public void generateReport(String path) {
        try {
            for (Customer customer : customers) {
                Files.write(Paths.get(path), String.format("Customer ID: %d%nTotal usage: %.1f%n%n", customer.getCustomerId(), calculateTotalUsage(customer.getCustomerId())).getBytes(), StandardOpenOption.APPEND);
            }
        } catch (IOException e) {
            System.out.printf("Error al generar el informe en el archivo \"%s\".", path);
        }
    }
}
