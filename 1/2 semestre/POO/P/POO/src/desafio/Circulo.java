package desafio;

public class Circulo extends Forma {
    private double radio;
    
    public Circulo(double radio, String color) {
        super(color);
        this.setRadio(radio);
    }
    
    public double getRadio() {
        return radio;
    }
    
    public void setRadio(double radio) {
        if(radio <= 0) {
            throw new IllegalArgumentException("El radio debe ser positivo");
        }
        this.radio = radio;
    }
    
    @Override
    public double calcularArea() {
        return Math.PI * radio * radio;
    }
    
    @Override
    public double calcularPerimetro() {
        return 2 * Math.PI * radio;
    }
    
    @Override
    public boolean equals(Object obj) {
        if(this == obj) return true;
        if(!(obj instanceof Circulo)) return false;
        Circulo otro = (Circulo)obj;
        return this.color.equals(otro.color) && 
               Math.abs(this.radio - otro.radio) < 0.0001;
    }
    
    @Override
    public String toString() {
        return String.format("Círculo [radio=%.2f, color=%s]", radio, color);
    }
}