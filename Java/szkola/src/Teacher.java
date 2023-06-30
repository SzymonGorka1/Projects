public class Teacher extends Worker{

    private String subject;
    public Teacher(String name, int age,double sal, String sub, int st) {
        super(name, age,sal, st);
        subject = sub;
    }

    @Override
    public void printSalary() {
        int kwotaWolna = 30;
        double prog = 0.18;
        int kosztUzyskania =150;
        if (getStaz() >= 5) {
            if (getStaz() <= 20) {
                setSallary(getSallary() + getStaz() * getSallary()/100);
            } else {
            setSallary(getSallary() * 1.2);
            }
            //kwata (rutto  -uzysk)*0 18 - kwota getWolna
            System.out.println("Płaca netto: " + 0.8*((getSallary()-kwotaWolna-kosztUzyskania*0.5))*0.18 + 0.2*((getSallary()-kwotaWolna-kosztUzyskania))*0.18+ kwotaWolna);
        }
    }

}

