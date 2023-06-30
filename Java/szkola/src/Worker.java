abstract public class Worker extends Person{

    private double sallary;
    private int staz;
    public Worker(String name, int age, double sal, int st) {
        super(name, age);
        sallary = sal;
        staz = st;
    }

    abstract public void printSalary();

    public double getSallary() {
        return sallary;
    }

    public void setSallary(double sallary) {
        this.sallary = sallary;
    }

    public int getStaz() {
        return staz;
    }

    public void setStaz(int staz) {
        this.staz = staz;
    }
}
