package aula08.exe1;

import java.util.ArrayList;
import java.util.List;

public class EmpresaAluguerViaturas {
    private String nome;
    private String codigoPostal;
    private String email;
    private List<Veiculo> viaturas;

    public EmpresaAluguerViaturas(String nome, String codigoPostal, String email) {
        this.nome = nome;
        this.codigoPostal = codigoPostal;
        this.email = email;
        this.viaturas = new ArrayList<>();
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCodigoPostal() {
        return codigoPostal;
    }

    public void setCodigoPostal(String codigoPostal) {
        this.codigoPostal = codigoPostal;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void adicionarViatura(Veiculo veiculo) {
        viaturas.add(veiculo);
    }

    public Veiculo getViaturaComMaiorKm() {
        Veiculo veiculoComMaiorKm = null;
        int maxKm = Integer.MIN_VALUE;
        for (Veiculo veiculo : viaturas) {
            if (veiculo instanceof KmPercorridosInterface) {
                KmPercorridosInterface veiculoComKm = (KmPercorridosInterface) veiculo;
                if (veiculoComKm.distanciaTotal() > maxKm) {
                    maxKm = veiculoComKm.distanciaTotal();
                    veiculoComMaiorKm = veiculo;
                }
            }
        }
        return veiculoComMaiorKm;
    }
}
