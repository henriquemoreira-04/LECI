package aula11;

import java.io.IOException;
import java.util.Arrays;
import java.util.LinkedList;

public class EnergyUsageReportTester {

    public static void main(String[] args) throws IOException {

        
        EnergyUsageReport energyReport = new EnergyUsageReport();

        
        energyReport.load("C:\\Users\\henri\\OneDrive\\Escritorio\\UA\\primer año\\2 semestre\\POO\\P\\POO\\src\\aula11\\clients.txt");

        
        Customer newCustomer = new Customer(999, new LinkedList<>(Arrays.asList(1500.0, 2000.0, 2500.0, 3000.0)));
        energyReport.addCustomer(newCustomer);

        
        energyReport.removeCustomer(1015);

        
        Customer retrievedCustomer = energyReport.getCustomer(1025);
       if (retrievedCustomer != null) {
       System.out.println("Customer retrieved: " + retrievedCustomer);
       } else {
       System.out.println("Customer not found.");
       }


        
        double totalEnergyUsage = energyReport.calculateTotalUsage(1003);
        System.out.println("Total energy usage for customer 1003: " + totalEnergyUsage);

        
        energyReport.generateReport("C:\\\\Users\\\\henri\\\\OneDrive\\\\Escritorio\\\\UA\\\\primer año\\\\2 semestre\\\\POO\\\\P\\\\POO\\\\src\\\\aula11\\\\energy_report.txt");
    }
}
