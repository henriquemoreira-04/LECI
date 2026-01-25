package aula02;

import java.util.ArrayList;
import java.util.Scanner;

public class Exe4 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        ArrayList<Double> numeros = new ArrayList<>();  // crear un array lista

        System.out.print("Digite un numero inicial: ");
        double primeiroNumero = scanner.nextDouble();
        numeros.add(primeiroNumero);  // agregar numeros al array

        while(true) {
            System.out.print("Digite otro numero: ");
            double numero = scanner.nextDouble();
            if (numero == primeiroNumero) {
                break;
            }
            numeros.add(numero);
        }
        
        scanner.close();

        double maximo = numeros.get(0);
        double minimo = numeros.get(0);
        double soma = 0;

        for (double num : numeros) {   // for(tipo elementos : coleccion)
            if (num > maximo) 
                maximo = num;
            if (num < minimo)
                minimo = num;
                
            soma += num;    
        }

        double media = soma / numeros.size(); // ver el tamano del array

        System.out.println("Valor máximo: " + maximo);
        System.out.println("Valor mínimo: " + minimo);
        System.out.println("Média: " + media);
        System.out.println("Total de números lidos: " + numeros.size());

        System.out.println("Numeros acima da media: ");

        for(double num : numeros) {
            if (num > media) 
            System.out.println(num);
        }






        
        

        
    }
    
}
