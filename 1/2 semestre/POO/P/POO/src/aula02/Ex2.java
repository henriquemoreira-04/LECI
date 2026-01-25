package aula02;
import java.util.Scanner;

public class Ex2 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in); // system.in es lo que se pone dentro del sisrema del teclado.
        
        System.out.print("coordenadas p1(x): "); //print normal no cambia de linea , println cambia de linea
        double x1 = scanner.nextDouble();

        System.out.print("coordenadas p1(y): ");
        double y1 = scanner.nextDouble();

        System.out.print("coordenadas p2(x): "); 
        double x2 = scanner.nextDouble();

        System.out.print("coordenadas p2(y): ");
        double y2 = scanner.nextDouble();

        scanner.close();

        double distancia = Math.sqrt(Math.pow(x2-x1,2) + Math.pow(y2-y1,2)); // pow primero numero segundo , a que numero se eleva

        System.out.println("La distancia entre los dos puntos es: " + distancia);






    }

    
}
