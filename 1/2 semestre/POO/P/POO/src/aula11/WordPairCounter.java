package aula11;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Scanner;
import java.util.TreeMap;
import java.util.stream.Collectors;

public class WordPairCounter {
    public static void main(String[] args) {
        TreeMap<String, HashMap<String, Integer>> wordPairs = new TreeMap<>();

        
        System.out.println("Ingrese la ruta del archivo:");
        Scanner scanner = new Scanner(System.in);
        String filePath = scanner.nextLine();
        Path path = Paths.get(filePath);

        
        String text = "";
        try {
            
            text = Files.readAllLines(path).stream().collect(Collectors.joining(System.lineSeparator()));
        } catch (IOException e) {
            System.out.printf("Error al leer el archivo \"%s\". Asegúrese de que el archivo esté en la ruta especificada.", path);
            System.exit(1);
        } finally {
            scanner.close(); 
        }

        
        Object[] words = Arrays.stream(text.split("[\\s.,:'‘’;?!\\-*{}=+&/()\\[\\]”“\"]+"))
                               .filter(word -> word.length() > 2)
                               .map(String::toLowerCase)
                               .toArray();

        
        for (int i = 1; i < words.length; i++) {
            String word1 = (String) words[i - 1];
            String word2 = (String) words[i];

            HashMap<String, Integer> word1Pair = wordPairs.getOrDefault(word1, new HashMap<>());
            wordPairs.put(word1, word1Pair);
            word1Pair.put(word2, word1Pair.getOrDefault(word2, 0) + 1);
        }

        
        wordPairs.entrySet().forEach(System.out::println);
    }
}
