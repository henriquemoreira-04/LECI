package aula03;
import java.util.Random;
import java.util.Scanner;

public class Exe2 {
    
    public static void altobaixo() {
        Scanner scanner = new Scanner(System.in);
        String respuesta;

        do {
            Random aleatorio = new Random();
            int secreto = aleatorio.nextInt(100) + 1; 

            System.out.println("I picked a number between 1 and 100. Can you guess it?");
            
            int contador = 0;
            int valor; 
            
            // Pedir el primer intento antes del bucle
            System.out.print("Valor: ");
            valor = scanner.nextInt(); 

            while(valor != secreto) {
                contador++;  

                if (valor > secreto) {
                    System.out.println("Valor alto");
                } else {
                    System.out.println("Valor bajo");
                }

                // Pedir un nuevo intento
                System.out.print("Valor: ");
                valor = scanner.nextInt();  
            }
            
            // Salió del bucle -> Adivinó el número
            contador++;
            System.out.println("¡Felicitaciones! Adivinaste el número.");
            System.out.println("Número de intentos: " + contador);

            // Preguntar si quiere continuar
            System.out.print("¿Pretende continuar? Prima (S)im: ");
            respuesta = scanner.next().trim(); // Leer la respuesta y eliminar espacios

        } while (respuesta.equalsIgnoreCase("S") || respuesta.equalsIgnoreCase("Sim"));

        System.out.println("Gracias por jugar. ¡Hasta la próxima!");
        scanner.close();
    }  
    
    public static void main(String[] args) {
        altobaixo();
    }
}
