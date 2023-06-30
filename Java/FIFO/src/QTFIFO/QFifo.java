package QTFIFO;
//realizacja tablicowa
//dodac klase publiczna QFifoException
//dodac  klase enum z kodami bledow( w tym samym pliku co QFifoExcepetion)
//enum ErrCode{FIFO_ALLOC_ERROR, FIFO_IS_EMPTY, OTHER_ERROR}
enum ErrorCode {FIFO_ALLOC_ERROR(1), FIFO_IS_EMPTY(2), FIFO_SIZE_NEGATIVE(3), OTHER_ERROR(0);
    private int  mCode;
    ErrorCode( int errCode ) {
        mCode = errCode;
    }
}

public class QFifo<T>
{
    //zdefiniowac prywatna klase dla elementu kolejki QFifoItem
    // --int mKey; SetKey(int newKey); int getKey();

    private class QFifoItem<T>
    {
        private T mKey;

        public QFifoItem(T i)
        {
            mKey = i;
        }

        public void setKey(T mKey) { this.mKey = mKey; }

        public T getKey() { return mKey; }
    }

    //KOLEJKA CYKLINCZA

    private QFifoItem [] q;
    private int mHead; //indeks pierwszego elem do pobrania z kolejki
    private int mTail; //indeks pierwszego wolnego miejsca w kolejce
    private int mElemNo; //ilosc elementów w kolejce

    public QFifo(int queueSize) throws QFifoException
    {
// queueSize<1 - wyjatek
        if(queueSize < 1)
            throw new QFifoException(ErrorCode.FIFO_SIZE_NEGATIVE);
        q = new QFifoItem[queueSize];
        mHead = mTail = mElemNo = 0;
    }

    public void QFEnqueue(int key) throws QFifoException
    {
        //wstawic do kolejki
        //mNoElem inkrementowac
        //przy inkrementacji mTail nie uzywac if

        if (mElemNo == q.length)
            throw new QFifoException(ErrorCode.FIFO_ALLOC_ERROR);
        mElemNo++;
        q[mTail] = new QFifoItem(key);
        mTail = (mTail + 1) % q.length;
    }

    public Object QFDequeue() throws QFifoException
    {
        //usunac z kolejki
        //mNoElem dekrymentowac
        //przy inkrementacji mHead nie uzywac if

        if(QFIsEmpty())
            throw new QFifoException(ErrorCode.FIFO_IS_EMPTY);
        mElemNo--;
        QFifoItem first = q[mHead];
        mHead = (mHead + 1) % q.length;
        return first.getKey();
    }

    public void QFClear()
    {
        //wyczyszczenie calej kolejki
        //wynulowac tabl

        for(int i = 0; i < q.length; i++)
        {
            q[i] = null;
        }

        mHead = mTail = mElemNo = 0;
    }

    public boolean QFIsEmpty()
    {
        return mElemNo == 0;
    }

    //skladowe
    //private QFifoItem [] q;
    //private int mHead; //indeks pierwszego elem do pobrania z kolejki
    //private in mTail; //indeks pierwszego wolnego miejsca w kolejce
    //private int mElemNo; //ilosc elementów w kolejce
}
