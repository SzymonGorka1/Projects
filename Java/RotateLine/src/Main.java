public class Main {
    public static void main(String[] args) {
        /* napisać klase odcinka (Segm) oraz zaintemplementować obrót odcinka o zadany kat w stopniach
         -- składowe 2 punkty (obiekty klasy Point) mPt1, mPt2
         -- konstruktory - x3 domyślny, z 4 doublami, z 2 punktami- pierwsze 2 wywołują 3-ci
         -- setSegm -x2 ( z 4 doublami, i z 2 punktami)
         -- settery - gettery ( getpoint1(), setPoint2())
         -- metoda Translate o wektor [vx,vy] ( vx, vy double)
         -- metoda Rotate(int nAngle) //kąt stopnia
         -- dokonać samodzielnej konwersji do radianow - deg2rad( nAngle) -> zdefiniować w klasie PI samodzielnie
                (z komputerowego kalkulatora XD)
         -- metoda Length() - dlugość kartezjańska
         -- toString - [1,2] -- [2,4] (taksię ma wypisać odcinek)
         -- prywatan ametoda ave( double x1, double x2 ) - srenida arytm

         napisać kalse Point do reprezentacji punkru na płaszczyźnie kartezjańskiej
         -- składowe publiczne typu double mx, my
         -- dwa konstruktory somyślny i z parametrami (dwoma doublami)
         -- settery i gettery( setX(), getX())
         -- metoda setPiont  z parametrami double oraz z parametrem Point
         -- metoda Rotate(double fRadians)  // wzory matematyczne Math.sin ...
         -- metoda Translate( double vx, double vy)
         -- metoda toString()   ->  [1,2] (ale wartości mają byc zaokraglone) - String.format("%1.3f")

         */

        Segm segment1 = new Segm(6, -2, 2,2);
        System.out.println("Dlugosc poczatkowa to: " + segment1.length() + ", pozycja to: " + segment1);
        segment1.Rotate(33);  //obrot o zadany kat w stopniach(deg)
        System.out.println("Dlugosc koncowa to: " + segment1.length() + ", pozycja to: " + segment1);

    }
}