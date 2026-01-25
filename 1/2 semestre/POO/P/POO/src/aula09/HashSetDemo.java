package aula09;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

class Pessoa {
    private String nome;
    private int cc;
    private Date dataNasc;

    public Pessoa(String nome, int cc, Date dataNasc) {
        this.nome = nome;
        this.cc = cc;
        this.dataNasc = dataNasc;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Pessoa pessoa = (Pessoa) o;
        return cc == pessoa.cc;
    }

    @Override
    public int hashCode() {
        return cc;
    }

    @Override
    public String toString() {
        return "Pessoa{" + "nome='" + nome + '\'' + ", cc=" + cc + ", dataNasc=" + dataNasc + '}';
    }
}

public class HashSetDemo {
    public static void main(String[] args) {
        Set<Pessoa> c3 = new HashSet<>();
        
        // Criando algumas datas (simplificado)
        Date d1 = new Date(1, 1, 1990);
        Date d2 = new Date(15, 3, 1985);
        Date d3 = new Date(20, 6, 2000);
        
        // Inserindo 5 elementos distintos
        c3.add(new Pessoa("Ana", 12345, d1));
        c3.add(new Pessoa("Bruno", 23456, d2));
        c3.add(new Pessoa("Carlos", 34567, d3));
        c3.add(new Pessoa("Diana", 45678, d1));
        c3.add(new Pessoa("Eva", 56789, d2));
        
        // Listando com iterator
        Iterator<Pessoa> it = c3.iterator();
        while (it.hasNext()) {
            System.out.println(it.next());
        }
        
        // Tentando inserir elemento repetido (mesmo CC)
        Pessoa repetido = new Pessoa("Ana Clone", 12345, d3);
        boolean added = c3.add(repetido);
        System.out.println("Elemento repetido foi adicionado? " + added);
        
        System.out.println("\nDepois de tentar adicionar repetido:");
        for (Pessoa p : c3) {
            System.out.println(p);
        }
    }
}