public class Point {
    //definicja zmiennych
    public double mx;
    public double my;

    //konstruktor domyslny
    Point (){
        this(0,0);
    }
    //konstruktor z 2 argumetami
    Point (double x, double y){
        mx = x;
        my = y;
    }

    //getttety i settery
    public double getX() {return mx;}
    public void setX(double mx) {this.mx = mx;}
    public double getY() {return my;}
    public void setY(double my) {this.my = my;}
    //Setter z argumetem typu Point
    public void SetPoint(Point point){
        this.setX(point.mx);
        this.setY(point.my);
    }
    //Setter z dwoma argumetami
    public void SetPoint(double x, double y){
        this.setX(x);
        this.setY(y);
    }
    //metoda przesuwajaca punkt o dany wektor
    public void Translate(double vx, double vy){
        setX(this.mx + vx);
        setY(this.my + vy);
    }
    //metoda obracajaca punkt wzgledem punku [0,0]
    public void Rotate(double fRadians){
        double temp = this.getX();
        setX(temp * Math.cos( fRadians ) - this.getY() * Math.sin( fRadians ));
        setY(temp * Math.sin( fRadians ) + this.getY() * Math.cos( fRadians ));
    }

    //metoda zwracajaca stringa w formacie "[X.XXX, X.XXX]
    public String toString(){
        return '[' + String.format("%1.3f", this.getX()) + ',' + String.format("%1.3f", this.getY()) + ']';
    }



}
