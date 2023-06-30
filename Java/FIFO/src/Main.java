import QTFIFO.QFifo;
import QTFIFO.QFifoException;
//import QFIFO.QFifo;
//import QFIFO.QFifoException;


public class Main
{
    public static void main(String[] args)
    {
//        try
//        {
//            QFifo<String> q1 = new QFifo<String>();
//
//            q1.QFEnqueue("1a");
//            q1.QFEnqueue("1f");
//            q1.QFEnqueue("1k");
//            q1.QFEnqueue("11");
//            q1.QFEnqueue("11");
//
//
//            System.out.println("q1: " + q1.QFDequeue() + ", " + q1.QFDequeue() + ", " + q1.QFDequeue() + ", "
//                    + q1.QFDequeue() + ", " + q1.QFDequeue());
//
//            QFifo q2 = new QFifo();
//
//            q2.QFEnqueue(1);
//            q2.QFEnqueue(2);
//            q2.QFEnqueue(3);
//            q2.QFEnqueue(4);
//            q2.QFEnqueue(5);
//            q2.QFEnqueue(6);
//            q2.QFEnqueue(7);
//            q2.QFDequeue();
//            q2.QFEnqueue(8);
//
//            System.out.println("q2: " + q2.QFDequeue() + ", " + q2.QFDequeue() + ", " + q2.QFDequeue() + ", "
//                    + q2.QFDequeue() + ", " + q2.QFDequeue());
//
//
//        } catch (QFifoException e)
//        {
//            System.out.println(e.getReason());
//        }

            //tablica
        try
        {
            QFifo<String> q1 = new QFifo<>(5);


            q1.QFEnqueue(1);
            q1.QFEnqueue(2);
            q1.QFEnqueue(3);
            q1.QFEnqueue(4);
            q1.QFEnqueue(5);

            System.out.println("q1: " + q1.QFDequeue() + ", " + q1.QFDequeue() + ", " + q1.QFDequeue() + ", "
                    + q1.QFDequeue() + ", " + q1.QFDequeue());

            QFifo q2 = new QFifo(5);

            q2.QFEnqueue(1);
            q2.QFEnqueue(2);
            q2.QFDequeue();
            q2.QFEnqueue(3);
            q2.QFEnqueue(4);
            q2.QFDequeue();
            q2.QFEnqueue(5);
            q2.QFEnqueue(6);
            q2.QFEnqueue(7);
            q2.QFDequeue();
            q2.QFEnqueue(8);

            System.out.println("q2: " + q2.QFDequeue() + ", " + q2.QFDequeue() + ", " + q2.QFDequeue() + ", "
                    + q2.QFDequeue() + ", " + q2.QFDequeue());


        } catch (QFifoException e)
        {
            System.out.println(e.getReason());
        }

    }
}
