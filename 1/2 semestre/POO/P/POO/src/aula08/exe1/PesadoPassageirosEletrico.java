package aula08.exe1;

public class PesadoPassageirosEletrico extends PesadoPassageiros implements VeiculoEletrico {
    private int autonomia;

    public PesadoPassageirosEletrico(String matricula, String marca, String modelo, int potencia, String numeroQuadro, int peso, int numMaxPassageiros, int autonomia) {
        super(matricula, marca, modelo, potencia, numeroQuadro, peso, numMaxPassageiros);
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
        
    }
}
