package desafio;

public class Triangulo extends Forma {
    private double lado1;
    private double lado2;
    private double lado3;
    
    public Triangulo(double lado1, double lado2, double lado3, String color) {
        super(color);
        this.setLados(lado1, lado2, lado3);
    }
    
    private boolean esTrianguloValido(double a, double b, double c) {
        return a > 0 && b > 0 && c > 0 &&
               a + b > c && a + c > b && b + c > a;
    }
    
    public double[] getLados() {
        return new double[]{lado1, lado2, lado3};
    }
    
    public void setLados(double lado1, double lado2, double lado3) {
        if(!esTrianguloValido(lado1, lado2, lado3)) {
            throw new IllegalArgumentException("Lados no válidos para un triángulo");
        }
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
    }
    
    @Override
    public double calcularArea() {
        double s = calcularPerimetro() / 2;
        return Math.sqrt(s * (s - lado1) * (s - lado2) * (s - lado3));
    }
    
    @Override
    public double calcularPerimetro() {
        return lado1 + lado2 + lado3;
    }
    
    @Override
    public boolean equals(Object obj) {
        if(this == obj) return true;
        if(!(obj instanceof Triangulo)) return false;
        Triangulo otro = (Triangulo)obj;
        return this.color.equals(otro.color) && 
               Math.abs(this.lado1 - otro.lado1) < 0.0001 &&
               Math.abs(this.lado2 - otro.lado2) < 0.0001 &&
               Math.abs(this.lado3 - otro.lado3) < 0.0001;
    }
    
    @Override
    public String toString() {
        return String.format("Triángulo [lados=%.2f,%.2f,%.2f, color=%s]", 
                           lado1, lado2, lado3, color);
    }
}