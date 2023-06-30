
import java.io.IOException;

public class Reader {
    private static char read='0';
    private static boolean pobrane = false;


    public static char getChar()
    {
        try {
            if(!pobrane){
                return (char) System.in.read();
            }
            pobrane = false;
            return  read;

        }
        catch (IOException e){
            return '\0';
        }

    }
    public static void unGetChar(char c)
    {
        read=c;
        pobrane=true;
    }
    public static int readInt()
    {
        boolean znak = getSign();
        int calk = readNum();
        return  (znak) ? -calk : calk;

    }
    public static double readDouble()
    {
        boolean znak = getSign();
        double liczba = readNum();
        char c = getChar();
        if(c =='.')
        {
            double przecinek = 0.1;
            while(isDecDigit(c = getChar()))
            {
                liczba+=charDecDigit2Int(c)*przecinek;
                przecinek*=0.1;
            }
        }
        unGetChar(c);
        return  (znak) ? -liczba : liczba;

    }
    public static int readHex() throws  IOException{

            char c;
            int liczba = 0;
            skipSpaces();
            if((c=getChar()) != '0') throw new IOException("HEX prefix should be 0x or 0X");
            if((c=getChar()) != 'x' && c != 'X') throw new IOException("HEX prefix should be 0x or 0X");
            while (isHexDigit(c=getChar()))
            {
                liczba = liczba *16 + charHexDigit2Int(c);
            }
            unGetChar(c);
            return liczba;
    }


    private static int readNum()
    {
        char c;
        int res = 0;
        skipSpaces();
        while (isDecDigit(c=getChar()))
        {
            res = res *10 + charDecDigit2Int(c);
        }
        unGetChar(c);
        return res;

    }
    private static boolean getSign()
    {
        skipSpaces();
        char c = getChar();
        if( c == '-') return true;
        if(c != '+') unGetChar(c);
        return false;
    }
    private static void skipSpaces()
    {
        char c;
        while( (c=getChar()) == ' ' || c == '\t' || c=='\n' || c=='\r');
        unGetChar(c);

    }
    private static boolean isDecDigit(char c){
        return (c>='0'&& c<='9');
    }
    private static boolean isHexDigit(char c)
    {
        return (isDecDigit(c) || isHexLetter(c));
    }
    private static char upperCase(char c){
        return (c>='a'&&c<='z')?(char)((int)c-32):0;
    }
    private static int charDecDigit2Int(char c) {
        return isDecDigit(c) ? (c-'0'):null;
    }
    private static boolean isHexLetter(char c) {
        return ((c>='A' && c<='F') || (c>='a' && c<='f'));
    }
    private static int charHexDigit2Int(char c) {
        return isHexLetter(c) ? ((int) upperCase(c) - 55) : charDecDigit2Int( c );
    }

}
