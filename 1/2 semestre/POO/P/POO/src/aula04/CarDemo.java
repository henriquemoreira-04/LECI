package aula04;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

class Car {
    public String make;
    public String model;
    public int year;
    public int kms;

    public Car(String make, String model, int year, int kms) {
        this.make = make;
        this.model = model;
        this.year = year;
        this.kms = kms;
    }

    public void drive(int distance) {
        this.kms += distance; // Acumula a distância percorrida ao total de quilômetros do carro
    }
}

public class CarDemo {

    static Scanner sc = new Scanner(System.in);

    static int registerCars(Car[] cars) {
        int numCars = 0;
        while (numCars < cars.length) {
            System.out.print("Insira dados do carro (marca modelo ano quilómetros): ");
            String input = sc.nextLine();
            if (input.isEmpty())
                break;

            if (validateCarData(input)) {
                String[] carData = input.split(" ");
                cars[numCars] = new Car(carData[0], carData[1], Integer.parseInt(carData[2]), Integer.parseInt(carData[3]));
                numCars++;
            } else {
                System.out.println("Dados mal formatados. Tente novamente.");
            }
        }
        return numCars;
    }

    static void registerTrips(Car[] cars, int numCars) {
        while (true) {
            System.out.print("Registe uma viagem no formato \"carro:distância\": ");
            String input = sc.nextLine();
            if (input.isEmpty())
                break;

            if (validateTripData(input)) {
                String[] tripData = input.split(":");
                int carIndex = Integer.parseInt(tripData[0]);
                int distance = Integer.parseInt(tripData[1]);
                if (carIndex >= 0 && carIndex < numCars) {
                    cars[carIndex].drive(distance);
                } else {
                    System.out.println("Índice de carro inválido. Tente novamente.");
                }
            } else {
                System.out.println("Dados mal formatados. Tente novamente.");
            }
        }
    }

    static void listCars(Car[] cars, int numCars) {
        System.out.println("\nCarros registados: ");
        for (int i = 0; i < numCars; i++) {
            System.out.printf("%s %s, %d, kms: %d\n", cars[i].make, cars[i].model, cars[i].year, cars[i].kms);
        }
        System.out.println();
    }

    static boolean validateCarData(String input) {
        // Regex para validar os dados do carro
        String regex = "^[A-Za-z]+(\\s[A-Za-z]+)*\\s\\d{4}\\s\\d+$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(input);
        return matcher.matches();
    }

    static boolean validateTripData(String input) {
        // Regex para validar os dados da viagem
        String regex = "^\\d+:\\d+$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(input);
        return matcher.matches();
    }

    public static void main(String[] args) {
        Car[] cars = new Car[10];
        int numCars = registerCars(cars);

        if (numCars > 0) {
            listCars(cars, numCars);
            registerTrips(cars, numCars);
            listCars(cars, numCars);
        }

        sc.close();
    }
}
