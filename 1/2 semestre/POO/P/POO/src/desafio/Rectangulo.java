package desafio;

public class Rectangulo extends Forma {
    private double ancho;
    private double alto;
    
    public Rectangulo(double ancho, double alto, String color) {
        super(color);
        this.setAncho(ancho);
        this.setAlto(alto);
    }
    
    public double getAncho() {
        return ancho;
    }
    
    public void setAncho(double ancho) {
        if(ancho <= 0) {
            throw new IllegalArgumentException("El ancho debe ser positivo");
        }
        this.ancho = ancho;
    }
    
    public double getAlto() {
        return alto;
    }
    
    public void setAlto(double alto) {
        if(alto <= 0) {
            throw new IllegalArgumentException("El alto debe ser positivo");
        }
        this.alto = alto;
    }
    
    @Override
    public double calcularArea() {
        return ancho * alto;
    }
    
    @Override
    public double calcularPerimetro() {
        return 2 * (ancho + alto);
    }
    
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        long temp;
        temp = Double.doubleToLongBits(ancho);
        result = prime * result + (int) (temp ^ (temp >>> 32));
        temp = Double.doubleToLongBits(alto);
        result = prime * result + (int) (temp ^ (temp >>> 32));
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Rectangulo other = (Rectangulo) obj;
        if (Double.doubleToLongBits(ancho) != Double.doubleToLongBits(other.ancho))
            return false;
        if (Double.doubleToLongBits(alto) != Double.doubleToLongBits(other.alto))
            return false;
        return true;
    }
    
    @Override
    public String toString() {
        return String.format("Rectángulo [ancho=%.2f, alto=%.2f, color=%s]", 
                           ancho, alto, color);
    }
}