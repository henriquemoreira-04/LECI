package desafio;

import java.util.ArrayList;
import java.util.Scanner;

public class TestFigurasPolimorfismo {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        ArrayList<Forma> formas = new ArrayList<>();
        
        int opcion;
        do {
            System.out.println("\nMENÚ DE FIGURAS GEOMÉTRICAS");
            System.out.println("1. Crear círculo");
            System.out.println("2. Crear triángulo");
            System.out.println("3. Crear rectángulo");
            System.out.println("4. Crear pentágono");
            System.out.println("5. Mostrar todas las figuras");
            System.out.println("6. Mostrar áreas y perímetros");
            System.out.println("7. Comparar figuras");
            System.out.println("0. Salir");
            System.out.print("Elige una opción: ");
            opcion = sc.nextInt();

            switch(opcion) {
                case 1:
                    formas.add(crearCirculo(sc));
                    break;
                    
                case 2:
                    formas.add(crearTriangulo(sc));
                    break;
                    
                case 3:
                    formas.add(crearRectangulo(sc));
                    break;
                    
                case 4:
                    formas.add(crearPentagono(sc));
                    break;
                    
                case 5:
                    mostrarFiguras(formas);
                    break;
                    
                case 6:
                    mostrarAreasYPerimetros(formas);
                    break;
                    
                case 7:
                    compararFiguras(formas);
                    break;
            }
        } while(opcion != 0);
        
        sc.close();
    }
    
    private static Circulo crearCirculo(Scanner sc) {
        System.out.print("Radio del círculo: ");
        double radio = sc.nextDouble();
        sc.nextLine(); 
        System.out.print("Color: ");
        String color = sc.nextLine();
        return new Circulo(radio, color);
    }
    
    private static Triangulo crearTriangulo(Scanner sc) {
        System.out.print("Lado 1 del triángulo: ");
        double l1 = sc.nextDouble();
        System.out.print("Lado 2 del triángulo: ");
        double l2 = sc.nextDouble();
        System.out.print("Lado 3 del triángulo: ");
        double l3 = sc.nextDouble();
        sc.nextLine(); 
        System.out.print("Color: ");
        String color = sc.nextLine();
        return new Triangulo(l1, l2, l3, color);
    }
    
    private static Rectangulo crearRectangulo(Scanner sc) {
        System.out.print("Ancho del rectángulo: ");
        double ancho = sc.nextDouble();
        System.out.print("Alto del rectángulo: ");
        double alto = sc.nextDouble();
        sc.nextLine(); 
        System.out.print("Color: ");
        String color = sc.nextLine();
        return new Rectangulo(ancho, alto, color);
    }
    
    private static Pentagono crearPentagono(Scanner sc) {
        System.out.print("Lado del pentágono: ");
        double lado = sc.nextDouble();
        sc.nextLine(); 
        System.out.print("Color: ");
        String color = sc.nextLine();
        return new Pentagono(lado, color);
    }
    
    private static void mostrarFiguras(ArrayList<Forma> formas) {
        if(formas.isEmpty()) {
            System.out.println("No hay figuras creadas.");
            return;
        }
        
        System.out.println("\nLISTA DE FIGURAS:");
        for(int i = 0; i < formas.size(); i++) {
            System.out.printf("%d. %s%n", i+1, formas.get(i));
        }
    }
    
    private static void mostrarAreasYPerimetros(ArrayList<Forma> formas) {
        if(formas.isEmpty()) {
            System.out.println("No hay figuras creadas.");
            return;
        }
        
        System.out.println("\nÁREAS Y PERÍMETROS:");
        for(Forma f : formas) {
            System.out.printf("%s - Área: %.2f, Perímetro: %.2f%n", 
                            f, f.calcularArea(), f.calcularPerimetro());
        }
    }
    
    private static void compararFiguras(ArrayList<Forma> formas) {
        if(formas.size() < 2) {
            System.out.println("Necesitas al menos 2 figuras para comparar.");
            return;
        }
        
        System.out.println("\nCOMPARACIÓN DE FIGURAS:");
        for(int i = 0; i < formas.size(); i++) {
            for(int j = i+1; j < formas.size(); j++) {
                Forma f1 = formas.get(i);
                Forma f2 = formas.get(j);
                
                if(f1.getClass() == f2.getClass() && f1.equals(f2)) {
                    System.out.printf("Figuras %d y %d son iguales (%s)%n", 
                                    i+1, j+1, f1.getClass().getSimpleName());
                }
            }
        }
    }
}