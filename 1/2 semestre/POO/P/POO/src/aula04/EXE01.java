package aula04;

import java.util.Scanner;

public class EXE01 {
    static class Circulo {
        private double raio;
    
        public Circulo(double raio) {
            if (raio <= 0) {
                throw new IllegalArgumentException("O raio deve ser um valor positivo.");
            }
            this.raio = raio;
        }
    
        public double calcularArea() {
            return Math.PI * Math.pow(raio, 2);
        }
    
        public double calcularPerimetro() {
            return 2 * Math.PI * raio;
        }
    
        @Override
        public String toString() {
            return "Círculo com raio " + raio;
        }
    }
    
    static class Triangulo {
        private double lado1;
        private double lado2;
        private double lado3;
    
        public Triangulo(double lado1, double lado2, double lado3) {
            if (lado1 <= 0 || lado2 <= 0 || lado3 <= 0) {
                throw new IllegalArgumentException("Os lados devem ser valores positivos.");
            }
            if (lado1 + lado2 <= lado3 || lado1 + lado3 <= lado2 || lado2 + lado3 <= lado1) {
                throw new IllegalArgumentException("Os lados não satisfazem a desigualdade triangular.");
            }
            this.lado1 = lado1;
            this.lado2 = lado2;
            this.lado3 = lado3;
        }
    
        public double calcularArea() {
            double s = (lado1 + lado2 + lado3) / 2;
            return Math.sqrt(s * (s - lado1) * (s - lado2) * (s - lado3));
        }
    
        public double calcularPerimetro() {
            return lado1 + lado2 + lado3;
        }
    
        @Override
        public String toString() {
            return "Triângulo com lados " + lado1 + ", " + lado2 + " e " + lado3;
        }
    }

    static class Retangulo {
        private double comprimento;
        private double altura;
    
        public Retangulo(double comprimento, double altura) {
            if (comprimento <= 0 || altura <= 0) {
                throw new IllegalArgumentException("Comprimento e altura devem ser valores positivos.");
            }
            this.comprimento = comprimento;
            this.altura = altura;
        }
    
        public double calcularArea() {
            return comprimento * altura;
        }
    
        public double calcularPerimetro() {
            return 2 * (comprimento + altura);
        }
    
        @Override
        public String toString() {
            return "Retângulo com comprimento " + comprimento + " e altura " + altura;
        }
    }

    public static class Main {
        public static void main(String[] args) {
            Scanner scanner = new Scanner(System.in);

            System.out.println("Bem-vindo ao programa de formas geométricas!");
            System.out.println("Escolha uma opção:");
            System.out.println("1. Criar um círculo");
            System.out.println("2. Criar um triângulo");
            System.out.println("3. Criar um retângulo");
            int opcao = scanner.nextInt();

            switch (opcao) {
                case 1:
                    System.out.print("Digite o raio do círculo: ");
                    double raio = scanner.nextDouble();
                    Circulo circulo = new Circulo(raio);
                    System.out.println("Área do círculo: " + circulo.calcularArea());
                    System.out.println("Perímetro do círculo: " + circulo.calcularPerimetro());
                    System.out.println(circulo);
                    break;
                
                case 2:
                    System.out.print("Digite os três lados do triângulo (separados por espaço): ");
                    double lado1 = scanner.nextDouble();
                    double lado2 = scanner.nextDouble();
                    double lado3 = scanner.nextDouble();
                    Triangulo triangulo = new Triangulo(lado1, lado2, lado3);
                    System.out.println("Área do triângulo: " + triangulo.calcularArea());
                    System.out.println("Perímetro do triângulo: " + triangulo.calcularPerimetro());
                    System.out.println(triangulo);
                    break;

                case 3:
                    System.out.print("Digite o comprimento e a altura do retângulo (separados por espaço): ");
                    double comprimento = scanner.nextDouble();
                    double altura = scanner.nextDouble();
                    Retangulo retangulo = new Retangulo(comprimento, altura);
                    System.out.println("Área do retângulo: " + retangulo.calcularArea());
                    System.out.println("Perímetro do retângulo: " + retangulo.calcularPerimetro());
                    System.out.println(retangulo);
                    break;

                default:
                    System.out.println("Opção inválida.");
                    break;

           }
           scanner.close();
        }  
    }
}
// colocar los que son equals 