package aula08.exe1;

public class PesadoMercadorias extends Veiculo {
    private String numeroQuadro;
    private int peso;
    private int cargaMaxima;

    public PesadoMercadorias(String matricula, String marca, String modelo, int potencia, String numeroQuadro, int peso, int cargaMaxima) {
        super(matricula, marca, modelo, potencia);
        this.numeroQuadro = numeroQuadro;
        this.peso = peso;
        this.cargaMaxima = cargaMaxima;
    }

    public String getNumeroQuadro() {
        return numeroQuadro;
    }

    public void setNumeroQuadro(String numeroQuadro) {
        this.numeroQuadro = numeroQuadro;
    }

    public int getPeso() {
        return peso;
    }

    public void setPeso(int peso) {
        this.peso = peso;
    }

    public int getCargaMaxima() {
        return cargaMaxima;
    }

    public void setCargaMaxima(int cargaMaxima) {
        this.cargaMaxima = cargaMaxima;
    }
}
