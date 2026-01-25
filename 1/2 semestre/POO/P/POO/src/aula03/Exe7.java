package aula03;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Exe7 {

    public static void main(String[] args) throws IOException {
        String fileName = "src/aula03/words.txt"; // File should be in the project directory
        List<String> wordsLongerThanTwo = new ArrayList<>();

        try (Scanner input = new Scanner(new BufferedReader(new FileReader(fileName)))) {
            // a) Test the code snippet to list the contents of the file:
            System.out.println("Contents of the file:");
            while (input.hasNext()) {
                String word = input.next();
                System.out.println(word);

                // b) Store all words with more than 2 characters in a suitable data structure:
                if (word.length() > 2) {
                    wordsLongerThanTwo.add(word);
                }
            }
        }

        System.out.println("\nWords longer than 2 characters:");
        System.out.println(wordsLongerThanTwo);

        // c) List all words ending in 's':
        System.out.println("\nWords ending with 's':");
        for (String word : wordsLongerThanTwo) {
            if (word.toLowerCase().endsWith("s")) {
                System.out.println(word);
            }
        }

        // d) Remove all words from the structure that contain characters other than letters:
        wordsLongerThanTwo.removeIf(word -> !word.matches("[a-zA-Z]+"));

        System.out.println("Words longer than 2 characters containing only letters:");
        System.out.println(wordsLongerThanTwo);
    }
}
