import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

//enum errCode
enum ErrorCode{ STACK_IS_EMPTY(1), OUT_OF_MEMORY(2), OTHER_ERROR(0) ;
    private int mCode;
    ErrorCode( int errCode )
    {
        mCode = errCode;
    }
}
// klasa ExceptionStack
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
            case OUT_OF_MEMORY: return "Index out of range";
            default: return "Other error";
        }
    }
}
//=================================================================================
public class Stack<T>
{
    private class StackItem<T>
    {
        private T mKey;
        private StackItem<T> mNext;

        public StackItem(T mKey, StackItem<T> mNext)
        {
            this.mKey = mKey;
            this.mNext = mNext;
        }

        public T getKey()
        {
            return mKey;
        }

        public StackItem<T> getNext()
        {
            return mNext;
        }
    }

    //List<StackItem> list = new ArrayList<>();       // deklaracja listy
    StackItem<T> mHead = null;

    // Add first element and push others
    void push( T c ) throws ExceptionStack
    {
        try
        {
            mHead = new StackItem(c, mHead);
        }
        catch( OutOfMemoryError e)
        {
            throw new ExceptionStack( ErrorCode.OUT_OF_MEMORY );
        }
    }

    // Delete and return first element
    T pop() throws ExceptionStack
    {
        if( isEmpty() )
        {
            throw new ExceptionStack( ErrorCode.STACK_IS_EMPTY );
        }
        T c = mHead.getKey();
        del();
        return c;
    }

    // Return first element, but don't delete
    T top() throws ExceptionStack
    {
        if( isEmpty() )
        {
            throw new ExceptionStack( ErrorCode.STACK_IS_EMPTY );
        }
        T c = mHead.getKey();
        return c;
    }

    // Delete first element, without return
    void del() throws ExceptionStack
    {
        if( isEmpty() )
        {
            throw new ExceptionStack( ErrorCode.STACK_IS_EMPTY );
        }
        mHead = mHead.getNext();
    }

    // Check if stack is empty
    boolean isEmpty()
    {
        return mHead==null;
    }

    // Prints all elements
    public void printAll()
    {
        for (StackItem p=mHead; p!=null; p =p.getNext())
        {
            System.out.print(p.getKey() + " ");
        }
    }
}




// klasa elementu stosu prywatna StackItem dla klasy stosu (priv char mKey, priv StackItem mNext)
// konstruktor i gettery

// POLECENIE --------------------------------------------------------
// zaimplementować klasę stosu - stos znakowy reprezentowany w postaci listy prostej
// do realizacji funkcji stosu, zdefiniować referencje do stosu początkowego null
// 10 jako stała
// do realizacji funkcji stosu zdefiniować indeks pierszego wolnego elementu na stosie
// metody klasy:
// void push(char c) - wkłada na stos,
// char pop() - usuwa i zwraca elem stosu,
// char top() - zwraca szczytowy elem stosu,
// void del() - usuwa szczytowy elem stosu,
// boolean isEmpty - zwraca true jeśli stos jest pusty, inaczej false
// funkcje wyrzucają wyjątki klasy ExceptionStack z parametrem ErrorCode

