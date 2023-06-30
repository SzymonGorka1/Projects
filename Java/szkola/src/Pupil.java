enum Subject{POLSKI, MATEMATYKA , FIZYKA, CHEMIA, INFORMATYKA, ANGIELSKI, NIEMIECKI}


abstract public class Pupil extends Person{
    private final static int SUB_NO = 7;
    private String mClassName; //np 2a
    private double mAve; //srednia
    private  double mNotes[] = new double[SUB_NO];

    protected String mID; // konstruowanie w kostruktorze Pupil oraz albo SchoolBoy albo SchoolGirl

    private static int ID = 1000;

    public Pupil(String name, int age, String className){
        super(name, age);
        mID  = Integer.toString(ID++);
        clearNotes();
        mClassName = className;
    }

    public  void clearNotes(){
        for(int i = 0; i<SUB_NO; i++) mNotes[i]=0;
    }



    private void setNote(Subject subj, double note){

        if (note%0.5 != 0 | note<2 | note >5) System.out.println("podano złą ocene podaj ocena w przedziale <2,5> gdzie ocena mod 0.5 =0");
        else {
            switch (subj) {
                case CHEMIA:        mNotes[0] = note; break;
                case FIZYKA:        mNotes[1] = note; break;
                case POLSKI:        mNotes[2] = note; break;
                case ANGIELSKI:     mNotes[3] = note; break;
                case NIEMIECKI:     mNotes[4] = note; break;
                case MATEMATYKA:    mNotes[5] = note; break;
                case INFORMATYKA:   mNotes[6] = note; break;

            }
        }
    }
    public double calcAve()
    {
        double ave = 0;
        for(int i = 0; i<SUB_NO; i++){
            ave += mNotes[i];
        }
        return ave /SUB_NO;

    }

    public double getAve(){
        calcAve();
        return mAve;
    }

    public String getID(){
        return mID;
    }

    abstract public void printOutfit();

    public String getmClassName(){
        return mClassName;
    }




    }




