import java.io.IOException;

public class Main
{
    public static void main(String[] args) throws IOException
    {
        System.out.println("Wpisz int: ");
        System.out.println(Reader.readInt());
        System.out.println("Wpisz double: ");
        System.out.println(Reader.readDouble());
        System.out.println("Wpisz HEX: ");
        int hex = Reader.readHex();
        System.out.printf( "0x%x - %d", hex,hex );

    }
}

