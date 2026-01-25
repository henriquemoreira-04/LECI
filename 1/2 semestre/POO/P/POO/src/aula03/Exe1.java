package aula03;

import java.util.Scanner;

public class Exe1 {
    
    public static boolean ePrimo(int num) {
        if (num <= 1) {
            return false;
        }
        for (int i = 2; i <= Math.sqrt(num); i++) {
            if (num % i == 0){
                return false;
            }
        }
        return true;
    
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int num;

        do {
            System.out.print("\nValor de numero positivo para num: ");
            num = sc.nextInt();
            if (num <= 0) {
                System.out.print("O valor deve ser positivo. ");
            }
        }   while (num <= 0);

        int sumprime = 0;
        for (int i = 2; i <= num; i++) {
            if (ePrimo(i)) {
                sumprime += i;
            }
        }
        System.out.println("A soma dos números primos até " + num + " é: " + sumprime);

        sc.close();
    }
}