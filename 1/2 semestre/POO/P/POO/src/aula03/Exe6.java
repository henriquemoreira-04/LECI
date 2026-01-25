package aula03;

import java.util.Scanner;

public class Exe6 {
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);
        int mes , ano , dia;
        do {

            System.out.print("Digite o a data! (mm/yyyy): ");
            String mesAno = input.nextLine();
            String[] parts = mesAno.split("/");

            mes = Integer.parseInt(parts[0]);
            ano = Integer.parseInt(parts[1]);

        } while (mes < 1 || mes > 12 || ano < 0);

        do {

            System.out.print("Digite o dia da semana de início (1 a 7): ");
            dia = input.nextInt();

        } while (dia < 1 || dia > 7);

        input.close();

        printCalendar(mes, ano, dia);

    } 

    public static void printCalendar(int mes, int ano, int dia) {

        int diasNoMes = getDiasNoMes(mes, ano);

        System.out.println("  Dom Seg Ter Qua Qui Sex Sáb");

        for (int i = 1; i < dia; i++) {
            System.out.print("    ");
        }

        for (int day = 1; day <= diasNoMes; day++) {
            System.out.printf("%4d", day);
            if ((day + dia - 1) % 7 == 0) {
                System.out.println();
            }
        }
    }

    public static int getDiasNoMes(int mes, int ano) {
        int diasEmMes;

        switch (mes) {

            case 4:
            case 6:
            case 9:

            case 11:
                diasEmMes = 30;
                break;

            case 2:
                diasEmMes = (ano % 4 == 0 && (ano % 100 != 0 || ano % 400 == 0)) ? 29 : 28;
                break;

            default:
                diasEmMes = 31;
        }

        return diasEmMes;
    }

}
