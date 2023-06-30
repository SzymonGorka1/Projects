public class Main
{
    public static void main(String[] args)
    {
        Stack<Character> st1 = new Stack<>();

        try
        {
            st1.push('a');
            st1.printAll();
            System.out.println();
            st1.push('b');
            st1.push('c');
            st1.push('d');
            System.out.println(st1.pop());
            System.out.println(st1.top());
            st1.printAll();
        }
        catch (ExceptionStack err)
        {
            System.out.println( err.getReason() );
        }
    }
}