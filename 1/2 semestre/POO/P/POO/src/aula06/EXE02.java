package aula06;

import java.util.ArrayList;
import java.util.Scanner;

class Pessoa {
    private String nome;

    public Pessoa(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }
}

class Contacto {
    private static int contadorIDs = 0;
    private int id;
    private Pessoa pessoa;
    private String numeroTelemovel;
    private String email;

    public Contacto(Pessoa pessoa, String numeroTelemovel, String email) {
        this.id = ++contadorIDs;
        this.pessoa = pessoa;
        this.numeroTelemovel = numeroTelemovel;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public Pessoa getPessoa() {
        return pessoa;
    }

    public String getNumeroTelemovel() {
        return numeroTelemovel;
    }

    public String getEmail() {
        return email;
    }

    public void setNumeroTelemovel(String numeroTelemovel) {
        this.numeroTelemovel = numeroTelemovel;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}

class ListaContactos {
    private ArrayList<Contacto> contactos = new ArrayList<>();

    public void inserirContacto(Contacto contacto) {
        contactos.add(contacto);
    }

    public void alterarContacto(int id, String novoNumeroTelemovel, String novoEmail) {
        for (Contacto contato : contactos) {
            if (contato.getId() == id) {
                contato.setNumeroTelemovel(novoNumeroTelemovel);
                contato.setEmail(novoEmail);
                break;
            }
        }
    }

    public void apagarContacto(int id) {
        contactos.removeIf(contato -> contato.getId() == id);
    }

    public Contacto procurarContacto(String termo) {
        for (Contacto contato : contactos) {
            if (contato.getPessoa().getNome().equalsIgnoreCase(termo) || contato.getNumeroTelemovel().equals(termo)) {
                return contato;
            }
        }
        return null;
    }

    public void listarContactos() {
        for (Contacto contato : contactos) {
            System.out.println("ID: " + contato.getId() + ", Nome: " + contato.getPessoa().getNome() +
                    ", Telemóvel: " + contato.getNumeroTelemovel() + ", Email: " + contato.getEmail());
        }
    }
}

class GestaoContactos {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        ListaContactos listaContactos = new ListaContactos();

        while (true) {
            System.out.println("1. Inserir contacto");
            System.out.println("2. Alterar contacto");
            System.out.println("3. Apagar contacto");
            System.out.println("4. Procurar contacto");
            System.out.println("5. Listar contactos");
            System.out.println("0. Sair");
            System.out.print("Opção: ");
            int opcao = scanner.nextInt();
            scanner.nextLine(); 

            switch (opcao) {
                case 1:
                    inserirContacto(scanner, listaContactos);
                    break;

                case 2:
                    alterarContacto(scanner, listaContactos);
                    break;

                case 3:
                    apagarContacto(scanner, listaContactos);
                    break;

                case 4:
                    procurarContacto(scanner, listaContactos);
                    break;

                case 5:
                    listaContactos.listarContactos();
                    break;

                case 0:
                    System.out.println("Saindo...");
                    System.exit(0);
                    break;

                default:
                    System.out.println("Opção inválida.");
            }
        }
    }

    private static void inserirContacto(Scanner scanner, ListaContactos listaContactos) {
        System.out.print("Nome: ");
        String nome = scanner.nextLine();
        System.out.print("Número de Telemóvel: ");
        String numeroTelemovel = scanner.nextLine();
        System.out.print("Email: ");
        String email = scanner.nextLine();

        if (!validarTelemovel(numeroTelemovel)) {
            System.out.println("Número de telemóvel inválido. Deve começar por '9' e conter 9 dígitos.");
            return;
        }

        if (!validarEmail(email)) {
            System.out.println("Endereço de email inválido.");
            return;
        }

        Pessoa pessoa = new Pessoa(nome);
        Contacto contacto = new Contacto(pessoa, numeroTelemovel, email);
        listaContactos.inserirContacto(contacto);
    }

    private static void alterarContacto(Scanner scanner, ListaContactos listaContactos) {
        System.out.print("Pesquisar por Nome ou Número de Telemóvel: ");
        String termoPesquisa = scanner.nextLine();
        Contacto contatoParaAlterar = listaContactos.procurarContacto(termoPesquisa);
        
        if (contatoParaAlterar != null) {
            System.out.print("Novo Número de Telemóvel: ");
            String novoNumeroTelemovel = scanner.nextLine();
            System.out.print("Novo Email: ");
            String novoEmail = scanner.nextLine();
            listaContactos.alterarContacto(contatoParaAlterar.getId(), novoNumeroTelemovel, novoEmail);
            System.out.println("Contacto alterado com sucesso.");
        } 
        else {
            System.out.println("Contacto não encontrado.");
        }
    }

    private static void apagarContacto(Scanner scanner, ListaContactos listaContactos) {
        System.out.print("Pesquisar por Nome ou Número de Telemóvel: ");
        String termoPesquisa = scanner.nextLine();
        Contacto contatoParaApagar = listaContactos.procurarContacto(termoPesquisa);
        if (contatoParaApagar != null) {
            listaContactos.apagarContacto(contatoParaApagar.getId());
            System.out.println("Contacto apagado com sucesso.");
        } else {
            System.out.println("Contacto não encontrado.");
        }
    }

    private static void procurarContacto(Scanner scanner, ListaContactos listaContactos) {
        System.out.print("Pesquisar por Nome ou Número de Telemóvel: ");
        String termoPesquisa = scanner.nextLine();
        Contacto contactoEncontrado = listaContactos.procurarContacto(termoPesquisa);
        if (contactoEncontrado != null) {
            System.out.println("Contacto encontrado:");
            System.out.println("ID: " + contactoEncontrado.getId() +
                    ", Nome: " + contactoEncontrado.getPessoa().getNome() +
                    ", Telemóvel: " + contactoEncontrado.getNumeroTelemovel() +
                    ", Email: " + contactoEncontrado.getEmail());
        } else {
            System.out.println("Contacto não encontrado.");
        }
    }

    private static boolean validarTelemovel(String numero) {
        return numero.matches("^9\\d{8}$");
    }

    private static boolean validarEmail(String email) {
        return email.matches("^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,}$");
    }
}
