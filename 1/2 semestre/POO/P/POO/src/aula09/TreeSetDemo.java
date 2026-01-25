package aula09;

import java.util.Set;
import java.util.TreeSet;

class Date implements Comparable<Date> {
    private int day;
    private int month;
    private int year;

    public Date(int day, int month, int year) {
        this.day = day;
        this.month = month;
        this.year = year;
    }

    @Override
    public int compareTo(Date other) {
        if (this.year != other.year) {
            return Integer.compare(this.year, other.year);
        }
        if (this.month != other.month) {
            return Integer.compare(this.month, other.month);
        }
        return Integer.compare(this.day, other.day);
    }

    @Override
    public String toString() {
        return String.format("%02d/%02d/%04d", day, month, year);
    }
}

public class TreeSetDemo {
    public static void main(String[] args) {
        Set<Date> c4 = new TreeSet<>();
        
        // Inserindo 5 datas em ordem aleatória
        c4.add(new Date(15, 3, 2020));
        c4.add(new Date(1, 1, 2022));
        c4.add(new Date(20, 6, 2019));
        c4.add(new Date(10, 10, 2021));
        c4.add(new Date(5, 5, 2020));
        
        // Verificando a ordem (será ordenada naturalmente)
        System.out.println("Datas ordenadas:");
        for (Date d : c4) {
            System.out.println(d);
        }
        
        // Tentando inserir elemento repetido
        boolean added = c4.add(new Date(15, 3, 2020));
        System.out.println("\nData repetida foi adicionada? " + added);
    }
}
