package aula09;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ALDemo {
    public static void main(String[] args) {
        ArrayList<Integer> c1 = new ArrayList<>();
        for (int i = 10; i <= 100; i += 10)
            c1.add(i);
        
        System.out.println("Size: " + c1.size());
        
        // Testando funções adicionais
        System.out.println("Contains 50? " + c1.contains(50));
        System.out.println("Index of 30: " + c1.indexOf(30));
        System.out.println("Last index of 30: " + c1.lastIndexOf(30)); // Só aparece uma vez
        
        // Adicionando um elemento repetido
        c1.add(30);
        System.out.println("Last index of 30 after adding another: " + c1.lastIndexOf(30));
        
        // Modificando um elemento
        c1.set(0, 5);
        System.out.println("First element after set: " + c1.get(0));
        
        // Sublista
        List<Integer> subList = c1.subList(2, 5);
        System.out.println("Sublist (2-5): " + subList);
        
        ArrayList<String> c2 = new ArrayList<>();
        c2.add("Vento");
        c2.add("Calor");
        c2.add("Frio");
        c2.add("Chuva");
        System.out.println(c2);
        
        Collections.sort(c2);
        System.out.println(c2);
        
        c2.remove("Frio");
        c2.remove(0);
        System.out.println(c2);
    }
}



