package aula03;

import java.util.*;

public class Ex3 {

    public static void main(String[] args) {
        int[] dimensoes = {1000, 5000, 10000, 20000, 40000, 100000}; // Tamanhos diferentes para teste

        System.out.println("------------------------------------------------------------");
        System.out.println("Comparação de Performance: ArrayList vs LinkedList");
        System.out.println("------------------------------------------------------------");

        // Teste para ArrayList
        System.out.printf("\n%-12s %-10s %-10s %-10s %-10s %-10s %-10s\n", 
                "Collection", "1000", "5000", "10000", "20000", "40000", "100000");
        System.out.println("---------------------------------------------------------------------------");
        
        System.out.printf("%-12s", "ArrayList");
        for (int dim : dimensoes) {
            Collection<Integer> col = new ArrayList<>();
            double[] resultados = checkPerformance(col, dim);
            System.out.printf("%-10.2f ", resultados[0]); // Tempo de adição
        }
        System.out.println();

        System.out.printf("%-12s", "Search");
        for (int dim : dimensoes) {
            Collection<Integer> col = new ArrayList<>();
            double[] resultados = checkPerformance(col, dim);
            System.out.printf("%-10.2f ", resultados[1]); // Tempo de busca
        }
        System.out.println();

        System.out.printf("%-12s", "Remove");
        for (int dim : dimensoes) {
            Collection<Integer> col = new ArrayList<>();
            double[] resultados = checkPerformance(col, dim);
            System.out.printf("%-10.2f ", resultados[2]); // Tempo de remoção
        }
        System.out.println("---------------------------------------------------------------------------");

        // Teste para LinkedList
        System.out.printf("%-12s", "LinkedList");
        for (int dim : dimensoes) {
            Collection<Integer> col = new LinkedList<>();
            double[] resultados = checkPerformance(col, dim);
            System.out.printf("%-10.2f ", resultados[0]); // Tempo de adição
        }
        System.out.println();

        System.out.printf("%-12s", "Search");
        for (int dim : dimensoes) {
            Collection<Integer> col = new LinkedList<>();
            double[] resultados = checkPerformance(col, dim);
            System.out.printf("%-10.2f ", resultados[1]); // Tempo de busca
        }
        System.out.println();

        System.out.printf("%-12s", "Remove");
        for (int dim : dimensoes) {
            Collection<Integer> col = new LinkedList<>();
            double[] resultados = checkPerformance(col, dim);
            System.out.printf("%-10.2f ", resultados[2]); // Tempo de remoção
        }
        System.out.println("---------------------------------------------------------------------------");
    }

    /**
     * Mede o tempo de execução das operações (add, search e remove) em uma coleção.
     *
     * @param col Estrutura de dados (ArrayList ou LinkedList)
     * @param DIM Número de elementos a testar
     * @return Um array contendo os tempos de execução das operações {add, search, remove}
     */
    private static double[] checkPerformance(Collection<Integer> col, int DIM) {
        double start, stop, addTime, searchTime, removeTime;

        // Adicionar elementos
        start = System.nanoTime();
        for (int i = 0; i < DIM; i++) {
            col.add(i);
        }
        stop = System.nanoTime();
        addTime = (stop - start) / 1e6; // Converter para milissegundos

        // Busca de elementos
        start = System.nanoTime();
        for (int i = 0; i < DIM; i++) {
            int n = (int) (Math.random() * DIM);
            col.contains(n);
        }
        stop = System.nanoTime();
        searchTime = (stop - start) / 1e6;

        // Remover elementos
        start = System.nanoTime();
        Iterator<Integer> iterator = col.iterator();
        while (iterator.hasNext()) {
            iterator.next();
            iterator.remove();
        }
        stop = System.nanoTime();
        removeTime = (stop - start) / 1e6;

        return new double[]{addTime, searchTime, removeTime};
    }
}

