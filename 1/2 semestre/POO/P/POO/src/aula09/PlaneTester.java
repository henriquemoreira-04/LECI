package aula09;

import java.util.Scanner;

public class PlaneTester {
    public static void main(String[] args) {
        PlaneManager manager = new PlaneManager();
        Scanner scanner = new Scanner(System.in);
        
        while (true) {
            System.out.println("\n--- Menu de Gestão de Frota ---");
            System.out.println("1. Adicionar avião comercial");
            System.out.println("2. Adicionar avião militar");
            System.out.println("3. Remover avião");
            System.out.println("4. Procurar avião");
            System.out.println("5. Listar todos os aviões");
            System.out.println("6. Listar aviões comerciais");
            System.out.println("7. Listar aviões militares");
            System.out.println("8. Mostrar avião mais rápido");
            System.out.println("0. Sair");
            System.out.print("Opção: ");
            
            int option = scanner.nextInt();
            scanner.nextLine(); // Consume newline
            
            switch (option) {
                case 1:
                    addCommercialPlane(manager, scanner);
                    break;
                case 2:
                    addMilitaryPlane(manager, scanner);
                    break;
                case 3:
                    removePlane(manager, scanner);
                    break;
                case 4:
                    searchPlane(manager, scanner);
                    break;
                case 5:
                    manager.printAllPlanes();
                    break;
                case 6:
                    printCommercialPlanes(manager);
                    break;
                case 7:
                    printMilitaryPlanes(manager);
                    break;
                case 8:
                    printFastestPlane(manager);
                    break;
                case 0:
                    System.out.println("A sair...");
                    scanner.close();
                    return;
                default:
                    System.out.println("Opção inválida!");
            }
        }
    }

    private static void addCommercialPlane(PlaneManager manager, Scanner scanner) {
        System.out.println("\nAdicionar avião comercial:");
        System.out.print("ID: ");
        String id = scanner.nextLine();
        System.out.print("Fabricante: ");
        String manufacturer = scanner.nextLine();
        System.out.print("Modelo: ");
        String model = scanner.nextLine();
        System.out.print("Ano: ");
        int year = scanner.nextInt();
        System.out.print("Passageiros máx.: ");
        int maxPassengers = scanner.nextInt();
        System.out.print("Velocidade máx. (km/h): ");
        int maxSpeed = scanner.nextInt();
        System.out.print("Tripulação: ");
        int crewMembers = scanner.nextInt();
        
        CommercialPlane plane = new CommercialPlane(id, manufacturer, model, year, 
                                                  maxPassengers, maxSpeed, crewMembers);
        manager.addPlane(plane);
        System.out.println("Avião comercial adicionado com sucesso!");
    }

    private static void addMilitaryPlane(PlaneManager manager, Scanner scanner) {
        System.out.println("\nAdicionar avião militar:");
        System.out.print("ID: ");
        String id = scanner.nextLine();
        System.out.print("Fabricante: ");
        String manufacturer = scanner.nextLine();
        System.out.print("Modelo: ");
        String model = scanner.nextLine();
        System.out.print("Ano: ");
        int year = scanner.nextInt();
        System.out.print("Passageiros máx.: ");
        int maxPassengers = scanner.nextInt();
        System.out.print("Velocidade máx. (km/h): ");
        int maxSpeed = scanner.nextInt();
        System.out.print("Munição: ");
        int ammoCount = scanner.nextInt();
        
        MilitaryPlane plane = new MilitaryPlane(id, manufacturer, model, year, 
                                             maxPassengers, maxSpeed, ammoCount);
        manager.addPlane(plane);
        System.out.println("Avião militar adicionado com sucesso!");
    }

    private static void removePlane(PlaneManager manager, Scanner scanner) {
        System.out.print("\nID do avião a remover: ");
        String id = scanner.nextLine();
        manager.removePlane(id);
        System.out.println("Avião removido com sucesso!");
    }

    private static void searchPlane(PlaneManager manager, Scanner scanner) {
        System.out.print("\nID do avião a procurar: ");
        String id = scanner.nextLine();
        Plane plane = manager.searchPlane(id);
        if (plane != null) {
            System.out.println(plane);
        } else {
            System.out.println("Avião não encontrado!");
        }
    }

    private static void printCommercialPlanes(PlaneManager manager) {
        System.out.println("\nAviões Comerciais:");
        for (CommercialPlane plane : manager.getCommercialPlanes()) {
            System.out.println(plane);
            System.out.println("-------------------");
        }
    }

    private static void printMilitaryPlanes(PlaneManager manager) {
        System.out.println("\nAviões Militares:");
        for (MilitaryPlane plane : manager.getMilitaryPlanes()) {
            System.out.println(plane);
            System.out.println("-------------------");
        }
    }

    private static void printFastestPlane(PlaneManager manager) {
        Plane fastest = manager.getFastestPlane();
        if (fastest != null) {
            System.out.println("\nAvião mais rápido:");
            System.out.println(fastest);
        } else {
            System.out.println("Não há aviões na frota!");
        }
    }
}
