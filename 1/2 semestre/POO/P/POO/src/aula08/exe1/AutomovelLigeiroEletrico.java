package aula08.exe1;

public class AutomovelLigeiroEletrico extends AutomovelLigeiro implements VeiculoEletrico {
    private int autonomia;

    public AutomovelLigeiroEletrico(String matricula, String marca, String modelo, int potencia, String numeroQuadro, int capacidadeBagageira, int autonomia) {
        super(matricula, marca, modelo, potencia, numeroQuadro, capacidadeBagageira);
        this.autonomia = autonomia;
    }

    public int getAutonomia() {
        return autonomia;
    }

    public void setAutonomia(int autonomia) {
        this.autonomia = autonomia;
    }

    @Override
    public int autonomia() {
        return autonomia;
    }

    @Override
    public void carregar(int percentagem) {
        // Simula um carregamento
    }
}
