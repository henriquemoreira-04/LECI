package aula03;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Exe5 {
    
    record Student(String name, double noteP, double noteT) {}
    
    public static void main(String[] args) {
        String fileName = "src/aula03/notas.txt"; // Replace with your file path
        List<Student> students = new ArrayList<>();
        double totalNoteP = 0;
        double totalNoteT = 0;
        int count = 0;
        
        try (BufferedReader br = new BufferedReader(new FileReader(fileName))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split("\t");
                if (parts.length == 3) {
                    String name = parts[0];
                    double noteP = Double.parseDouble(parts[1]);
                    double noteT = Double.parseDouble(parts[2]);
                    
                    students.add(new Student(name, noteP, noteT));
                    totalNoteP += noteP;
                    totalNoteT += noteT;
                    count++;
                }
            }
        } catch (IOException e) {
            System.err.println("Error reading file: " + e.getMessage());
            return;
        }
        
        if (count == 0) {
            System.out.println("No data found in the file.");
            return;
        }
        
        double avgNoteP = totalNoteP / count;
        double avgNoteT = totalNoteT / count;
        
        System.out.printf("Average noteP: %.2f%n", avgNoteP);
        System.out.printf("Average noteT: %.2f%n", avgNoteT);
        
        System.out.println("Students with noteT above average:");
        for (Student student : students) {
            if (student.noteT() > avgNoteT) {
                System.out.println(student.name());
            }

        }

        System.out.println("Students with noteP above average:");
        for (Student student : students) {
            if (student.noteP() > avgNoteP) {
                System.out.println(student.name());  // intentar ahora con los de la aula completa 
            }

        }
    }
}
