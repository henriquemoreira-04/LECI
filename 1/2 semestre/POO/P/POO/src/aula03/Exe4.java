package aula03;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Exe4 {

    public static class Alumno {
        private String nombre;
        private double notaT;
        private double notaP;

        public Alumno(String nombre, double notaT, double notaP) {
            this.nombre = nombre;
            this.notaT = notaT;
            this.notaP = notaP;
        }

        public String getNombre() {
            return nombre;
        }

        public double getNotaT() {
            return notaT;
        }

        public double getNotaP() {
            return notaP;
        }
    }

    public static int calcularNotaFinal(double notaT, double notaP) {
        if (notaT < 7.0 || notaP < 7.0) {
            return 66;
        } else {
            return (int) Math.round(0.4 * notaT + 0.6 * notaP);
        }
    }

    public static List<Alumno> leerDatosDesdeArchivo(String nombreArchivo) throws IOException {
        List<Alumno> alumnos = new ArrayList<>();
        BufferedReader br = new BufferedReader(new FileReader(nombreArchivo));
        String linea;
        while ((linea = br.readLine()) != null) {
            // Divide la línea por tabulaciones
            String[] partes = linea.split("\t");

            // Verifica que la línea tenga exactamente 3 partes
            if (partes.length == 3) {
                try {
                    String nombre = partes[0];
                    double notaT = Double.parseDouble(partes[1]);
                    double notaP = Double.parseDouble(partes[2]);
                    alumnos.add(new Alumno(nombre, notaT, notaP));
                } catch (NumberFormatException e) {
                    System.err.println("Error en el formato de las notas en la línea: " + linea);
                }
            } else {
                System.err.println("Línea mal formateada: " + linea);
            }
        }
        br.close();
        return alumnos;
    }

    public static List<String> procesarNotas(List<Alumno> alumnos) {
        System.out.println("NotaT\tNotaP\tPauta");
        List<String> aprobados = new ArrayList<>();
        for (Alumno alumno : alumnos) {
            double notaT = alumno.getNotaT();
            double notaP = alumno.getNotaP();
            int pauta = calcularNotaFinal(notaT, notaP);
            System.out.printf("%.1f\t%.1f\t%d%n", notaT, notaP, pauta);
            if (pauta != 66) {
                aprobados.add(alumno.getNombre());
            }
        }
        return aprobados;
    }

    public static void main(String[] args) {
        String nombreArchivo = "C:\\\\Users\\\\henri\\\\OneDrive\\\\Escritorio\\\\UA\\\\segundo año\\\\segundo semestre\\\\POO 2\\\\P\\\\POO\\\\src\\\\aula03\\\\notas.txt"; // Cambia esto si es necesario
        File archivo = new File(nombreArchivo);

        if (!archivo.exists()) {
            System.err.println("El archivo no existe: " + nombreArchivo);
            return;
        }

        try {
            List<Alumno> alumnos = leerDatosDesdeArchivo(nombreArchivo);
            List<String> aprobados = procesarNotas(alumnos);
            System.out.println("\nAlumnos aprobados:");
            for (String nombre : aprobados) {
                System.out.println(nombre);
            }
        } catch (IOException e) {
            System.err.println("Error al leer el archivo: " + e.getMessage());
        }
    }
}