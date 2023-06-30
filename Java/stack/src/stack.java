enum ErrorCode{ STACK_IS_EMPTY(1), INDEX_OUT_OF_RANGE(2), OTHER_ERROR(0) ;
    private int mCode;
    ErrorCode( int errCode )
    {
        mCode = errCode;
    }
}
//enum errCode
class ExceptionStack extends Exception
{
    private ErrorCode mErrorCode;
    ExceptionStack(ErrorCode errorCode )
    {
        mErrorCode = errorCode;
    }
    public String getReason()
    {
        switch (mErrorCode)
        {
            case STACK_IS_EMPTY: return "Stack is empty";
            case INDEX_OUT_OF_RANGE: return "Index out of range";
            default: return "Other error";
        }
    }
}
//=================================================================================
public class stack
{
    final static int tab_size = 10;     //stała definiująca rozmiar stosu
    char[] tab = new char[tab_size];    //deklaracja stosu
    int index = 0;                      //index - pierwszy pusty element stosu

    // Add first element and push others
    void push( char c ) throws ExceptionStack
    {
        if (index >= 10)
        {
            throw new ExceptionStack(ErrorCode.INDEX_OUT_OF_RANGE);
        }
        if (index > 0)
        {
            for( int i = index; i>0; i--)
            {
                tab[i] = tab[i-1];
            }
        }
        tab[0] = c;
        index++;
    }

    // Delete and return first element
    char pop() throws ExceptionStack
    {
        if (index <= 0)
        {
            throw new ExceptionStack(ErrorCode.STACK_IS_EMPTY);
        }
        char ret = tab[0];

        for( int i = 0; i<index; i++)
        {
            tab[i] = tab[i+1];
        }
        tab[index] = 0x00;
        index--;

        return ret;
    }

    // Return first element, but don't delete
    char top() throws ExceptionStack
    {
        if (index <= 0)
        {
            throw new ExceptionStack(ErrorCode.STACK_IS_EMPTY);
        }
        return tab[0];
    }

    // Delete first element, without return
    void del() throws ExceptionStack
    {
        if (index <= 0)
        {
            throw new ExceptionStack(ErrorCode.STACK_IS_EMPTY);
        }

        for( int i = 0; i<index; i++)
        {
            tab[i] = tab[i+1];
        }
        tab[index] = 0x00;
        index--;
    }

    // Check if stack is empty
    boolean isEmpty()
    {
        return index <= 0;
    }

    // Print the whole stack (starting from the first)
    public String toStr() throws ExceptionStack
    {
        String result = "";

        if (index <= 0)
        {
            throw new ExceptionStack(ErrorCode.STACK_IS_EMPTY);
        }
        else
        {
            for( int i = 0; i<index; i++)
            {
                result = (result + tab[i] + " ");
            }
        }
        return result;
    }

}


// POLECENIE --------------------------------------------------------
// zaimplementować klasę stosu - stos znakowy reprezentowany w postaci tablicy 10 elementowej
// (implementacja w konstruktorze)
// 10 jako stała
// do realizacji funkcji stosu zdefiniować indeks pierszego wolnego elementu na stosie
// metody klasy:
// void push(char c) - wkłada na stos,
// char pop() - usuwa i zwraca elem stosu,
// char top() - zwraca szczytowy elem stosu,
// void del() - usuwa szczytowy elem stosu,
// boolean isEmpty - zwraca true jeśli stos jest pusty, inaczej false
// funkcje wyrzucają wyjątki klasy ExceptionStack z parametrem ErrorCode

