package aula02;
import java.util.Scanner;

public class Exe6 {
    // contar numero de caracteres numericos
    public static int countDigits(String s){
        int contador = 0;

        for (char num : s.toCharArray()) { // convierte el caracter a new characyer array
            
            if(Character.isDigit(num)) {
                contador++; // ++ incrementa en 1
            }
        
        }
        
        return contador; // los return afuera de los {} de los fors

    
    }

    

    
    
    
    
    
    public static void main(String[] args) {
        
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("Digite una frase que contenga numeros: ");
        String frase = scanner.nextLine();
        
        scanner.close();

        System.out.println("Numero de caracteres numericos: " + countDigits(frase));
    }
    
    
    
    
    
    //contar espacios
    //indicar si son solo minusculas
    
    
    
}
