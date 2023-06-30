public class Main {
    public static void main(String[] args) throws ExceptionStack
    {
        stack st1 = new stack();

        try {
            st1.push('a');
            System.out.println(st1.toStr());
            st1.push('b');
            st1.push('c');
            st1.push('d');
            System.out.println(st1.toStr());
            System.out.println(st1.pop());
            System.out.println(st1.toStr());
        } catch (ExceptionStack err) {
            System.out.println( err.getReason() );
        }
    }
}