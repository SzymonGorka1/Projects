public class Segm {
    //definicje zmiennych
    private Point mPt1;////!!!!
    private Point mPt2;
    //definicja i inicjalizacja liczby PI uzyskanej z kalkulatora
    static private final double PI = 3.14159265358979;

    //konstruktor domyslny
    Segm (){this(new Point(0,0), new Point(0,0));}

    // konstrukor 4 wspolrzedne
    Segm(Point point1, Point point2){
        mPt1 = point1;
        mPt2 = point2;
    }

    // konstrukor 2 punkty
    Segm(double x1, double y1, double x2, double y2){
        this(new Point(x1,y1), new Point(x2,y2));
    }

    //SETTERY I GETTERY
    public void SetSegm(double x1, double y1, double x2, double y2){
        mPt1.SetPoint(x1,y1);
        mPt2.SetPoint(x2,y2);
    }

    public void SetSegm(Point p1, Point p2){
        mPt1.SetPoint(p1);
        mPt2.SetPoint(p2);
    }

    public Point getPoint1() {return mPt1;}
    public void setPoint1(Point mPt1) {this.mPt1 = mPt1;}
    public Point getPoint2() {return mPt2;}
    public void setPoint2(Point mPt2) {this.mPt2 = mPt2;}

    //TRANSLATE metoda przenoszaca zbior 2 punktow o dany wektor
    public void Translate(double vx, double vy){
        mPt1.Translate(vx,vy);
        mPt2.Translate(vx,vy);
    }
    //deg2rad metoda zmaieniajaca kat w deg na radiany
    private double deg2rad(int nAngle){
        return( nAngle*PI/180);
    }

    //metoda rotate obracajaca odcinek o zadany kont (w deg)
    public void Rotate(int nAngle){
        double tempx = avg(mPt1.getX(),mPt2.getX());
        double tempy = avg(mPt1.getY(),mPt2.getY());

        Translate(-tempx,-tempy);
        mPt1.Rotate(deg2rad(nAngle));
        mPt2.Rotate(deg2rad(nAngle));
        Translate(tempx,tempy);

    }

    //metoda avg obliczajaca srednia z dwuoch punktow
    private double avg(double x1, double x2){
        return (x1+x2)/2;
    }

    //Metoda Lenght obliczajaca dlufosc miedzy 2 punkrtami
    public String length(){
        return String.format("%1.3f", Math.sqrt((mPt1.getX()- mPt2.getX())*(mPt1.getX()- mPt2.getX())
                + (mPt1.getY()- mPt2.getY())*(mPt1.getY()- mPt2.getY())));
    }
    // metoda zwracająca stringa w formacie "[X.XXX,X.XXX]--[X.XXX,X.XXX]
    public String toString(){
        return mPt1.toString() + '-' + '-' + mPt2.toString();
    }


}
