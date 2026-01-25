package desafio;

public class Pentagono extends Forma {
    private double lado;
    
    public Pentagono(double lado, String color) {
        super(color);
        this.setLado(lado);
    }
    
    public double getLado() {
        return lado;
    }
    
    public void setLado(double lado) {
        if(lado <= 0) {
            throw new IllegalArgumentException("El lado debe ser positivo");
        }
        this.lado = lado;
    }
    
    @Override
    public double calcularArea() {
        return (5.0 * lado * lado) / (4.0 * Math.tan(Math.PI / 5.0));
    }
    
    @Override
    public double calcularPerimetro() {
        return 5 * lado;
    }
    
    @Override
    public boolean equals(Object obj) {
        if(this == obj) return true;
        if(!(obj instanceof Pentagono)) return false;
        Pentagono otro = (Pentagono)obj;
        return this.color.equals(otro.color) && 
               Math.abs(this.lado - otro.lado) < 0.0001;
    }
    
    @Override
    public String toString() {
        return String.format("Pentágono [lado=%.2f, color=%s]", lado, color);
    }
}