package desafio;

public abstract class Forma {
    protected String color;
    
    public Forma(String color) {
        this.setColor(color);
    }
    
    public abstract double calcularArea();
    public abstract double calcularPerimetro();
    
    public String getColor() {
        return color;
    }
    
    public void setColor(String color) {
        if(color == null || color.trim().isEmpty()) {
            throw new IllegalArgumentException("El color no puede estar vacío");
        }
        this.color = color;
    }
    
    @Override
    public abstract boolean equals(Object obj);
    
    @Override
    public abstract String toString();
}