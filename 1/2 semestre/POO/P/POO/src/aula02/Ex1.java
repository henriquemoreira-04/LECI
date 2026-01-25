package aula02;
import java.util.Scanner;


public class Ex1 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Insira um numero de segundos: ");
        int temposegundos = scanner.nextInt();
        scanner.close();

        int horas = temposegundos / 3600;
        int minutos = (temposegundos % 3600) / 60;
        int segundos = temposegundos % 60;

        System.out.println("Tempo formatado: " + horas + "h" + ":" + minutos + "m" + ":" + segundos + "s" );




    }

}
