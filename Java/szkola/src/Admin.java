public class Admin extends Worker{
    public Admin(String name, int age, int sal, int st) {
        super(name, age, sal,st);
    }

    @Override
    public void printSalary() {
        int kwotaWolna = 30;
        double prog = 0.18;
        int kosztUzyskania =150;

        System.out.println("Płaca netto: " + ((getSallary()-kwotaWolna-kosztUzyskania))*0.18+ kwotaWolna);
    }
}   //wota wolna 30;
//         koszty uzysku 150;
//kwata (rutto  -uzysk)*0 18 - kwota getWol