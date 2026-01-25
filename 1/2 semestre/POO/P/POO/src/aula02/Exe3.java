package aula02;
import java.util.Scanner;

public class Exe3 {
    public static void main(String[] args) {
        double catetoA, catetoB, hipotenusa, anguloRAD, anguloGraus;
        Scanner scanner = new Scanner(System.in);

        do {
            System.out.print("Valor do cateto A: ");
            catetoA = scanner.nextDouble();
            if (catetoA <= 0) {
                System.out.println("Erro: O valor do cateto A deve ser positivo."); // hacer mientras catet0  sea menor o igul
            }
        } while (catetoA <= 0);

        
        do {
            System.out.print("Valor do cateto B: ");
            catetoB = scanner.nextDouble();
            if (catetoB <= 0) {
                System.out.println("Erro: O valor do cateto B deve ser positivo.");
            }
        } while (catetoB <= 0);

        hipotenusa = Math.sqrt(Math.pow(catetoA, 2) + Math.pow(catetoB, 2)); // pow el segundo es el numero al que se ira elevar

        anguloRAD = Math.atan(catetoA / catetoB); // convierte angulos en radianos
        anguloGraus = Math.toDegrees(anguloRAD); // convierte angulos en grados

        System.out.println("O valor da hipotenusa é: " + hipotenusa);
        System.out.println("O ângulo entre o cateto A e a hipotenusa é: " + anguloGraus + " graus.");

        scanner.close();
    }
}
