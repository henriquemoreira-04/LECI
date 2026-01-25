package aula11;

import java.util.Arrays;
import java.util.LinkedList;

public class GradebookTester {
    public static void main(String[] args) {
        // Create a new Gradebook instance
        Gradebook gradebook = new Gradebook();

        // Load the student data from a text file
        gradebook.load("C:\\Users\\henri\\OneDrive\\Escritorio\\UA\\primer año\\2 semestre\\POO\\P\\POO\\src\\aula11\\alunos.txt");

        // Add a new student to the collection
        Student newStudent = new Student("Johny May", new LinkedList<>(Arrays.asList(10.0, 15.0, 19.0)));
        gradebook.addStudent(newStudent);

        // Remove a student from the collection
        gradebook.removeStudent("Jane Smith");

        // Retrieve a student from the collection
        Student student = gradebook.getStudent("John Doe");
        
        // Verificar si el estudiante no es nulo antes de usarlo
        if (student != null) {
            // Calculate the average grade for a specific student
            double averageGrade = gradebook.calculateAverageGrade("John Doe");
            System.out.println("Average grade for John Doe: " + averageGrade);
        } else {
            System.out.println("No se encontró al estudiante John Doe en la colección.");
        }

        // Print a summary of all students in the collection
        gradebook.printAllStudents();
    }
}
