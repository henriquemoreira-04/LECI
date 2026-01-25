package aula08.exe1;

public class Main {
    public static void main(String[] args) {
        
        Motociclo moto = new Motociclo("00-AB-01", "Yamaha", "MT-07", 75, "Desportivo");
        AutomovelLigeiro carro = new AutomovelLigeiro("99-CD-02", "Toyota", "Corolla", 120, "12345", 500);
        Taxi taxi = new Taxi("11-EF-03", "Ford", "Fiesta", 90, "54321", 400, "987654");
        PesadoMercadorias camiao = new PesadoMercadorias("22-GH-04", "Mercedes", "Actros", 400, "13579", 2000, 10000);
        PesadoPassageiros autocarro = new PesadoPassageiros("33-IJ-05", "Volvo", "9700", 300, "97531", 1500, 50);

        
        EmpresaAluguerViaturas empresa = new EmpresaAluguerViaturas("AluguerExpress", "12345-678", "contato@aluguerexpress.com");
        empresa.adicionarViatura(moto);
        empresa.adicionarViatura(carro);
        empresa.adicionarViatura(taxi);
        empresa.adicionarViatura(camiao);
        empresa.adicionarViatura(autocarro);

        
        System.out.println("Viatura com maior quilometragem percorrida:");
        Veiculo veiculoComMaiorKm = empresa.getViaturaComMaiorKm();
        if (veiculoComMaiorKm != null) {
            System.out.println(veiculoComMaiorKm);
        } else {
            System.out.println("Nenhuma viatura com quilometragem disponível.");
        }
    }
}
