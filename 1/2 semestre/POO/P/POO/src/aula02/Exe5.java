package aula02;

import java.util.Scanner;

public class Exe5 {
    public static void main(String[] args) {
        
        String string,minusculas;
        
        Scanner scanner = new Scanner(System.in);
        System.out.print("diga una palabra o una frase: ");
        string = scanner.nextLine();
        scanner.close();

        minusculas = string.toLowerCase();
        // a) para convertir todo a minuscula

        
        char ultimoCaracter = string.charAt(string.length() - 1); // chaat ve el caracter despues haces el lemgt para tener 
        // b) la distancia total y despues e=le quitas uno recuerda length 9 = indexmax 8

        
        String primerosTres = string.substring(0, 3);
        // c) tirar una substring es mas facil para retirar los prineros caraxteres
        
          

        System.out.println(string);
        System.out.println(minusculas);
        System.out.println(ultimoCaracter);
        System.out.println(primerosTres);

        // length() trim() elimina espacios en blanco al principio y L FINAL 
        //contains() sale un bool replace () reemplaza indexOf()



    }
}
