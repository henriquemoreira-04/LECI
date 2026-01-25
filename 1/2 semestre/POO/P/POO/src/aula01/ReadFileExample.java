package aula01;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;


public class ReadFileExample {

	public static void main(String[] args) {
		Path fich = Paths.get("C:\\Users\\henri\\OneDrive\\Escritorio\\UA\\segundo año\\segundo semestre\\POO 2\\P\\POO\\src\\aula01\\major.txt");
		try {
			Files.readAllLines(fich).stream().forEach(System.out::println);
		} catch (IOException e) {
			System.out.println("Certifique-se que o ficheiro \"major.txt\" está na raiz da pasta do projeto");
		}
	}
	
}
