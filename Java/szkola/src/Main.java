public class Main {
    public static void main(String[] args) {
        Pupil[] pupil = new Pupil[6];
        pupil[0] = new SchoolGirl("Kasia", 13, "2b");
        pupil[1] = new SchoolGirl("Asia", 13, "2b");
        pupil[2] = new SchoolGirl("Stasia", 13, "2b");
        pupil[3] = new SchoolBoy("Antek", 14, "2b");
        pupil[4] = new SchoolBoy("Marek", 13, "2b");
        pupil[5] = new SchoolBoy("Juzek", 14, "2b");

        printAllPupil(pupil);


    }

    public static void printAllPupil(Pupil pupil[]) {

        for (int i = 0; i < pupil.length; i++) {
            System.out.print("id: " + pupil[i].getID() + " Name: " + pupil[i].getmName() + " averation: " + pupil[i].getAve()
                    + " class: " + pupil[i].getmClassName() + " age: " + pupil[i].getmAge() + " ");
            pupil[i].printOutfit();
        }
    }
}