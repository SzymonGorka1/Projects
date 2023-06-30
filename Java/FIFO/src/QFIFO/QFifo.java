package QFIFO;

//realizacja w postaci listy prostej
//dodac publicna klase QFifoException
//dodac klase enum
enum ErrorCode {FIFO_ALLOC_ERROR(1), FIFO_IS_EMPTY(2), FIFO_SIZE_NEGATIVE(3), OTHER_ERROR(0);
    private int  mCode;
    ErrorCode( int errCode ) {
        mCode = errCode;
    }
}

public class QFifo
{
    private class QFifoItem
    {
        private int mKey;
        private QFifoItem mNext;

        public QFifoItem(int i)
        {
            mKey = i;
            mNext = null;
        }

        public QFifoItem() {
            this(0);
        }


        public void setKey(int mKey) { this.mKey = mKey; }

        public int getKey() { return mKey; }

        public void setNext(QFifoItem next) { this.mNext = next; }

        public QFifoItem getNext() { return mNext; }
    }

    private QFifoItem mHead;
    private QFifoItem mTail;

    public QFifo()
    {
        mHead = mTail = new QFifoItem();
    }

    public boolean QFIsEmpty()
    {
        return mHead.getNext() == null;
    }

    public void QFEnqueue(int key) throws QFifoException
    {

        mTail.setNext( new QFifoItem(key) );
        mTail = mTail.getNext();
    }

    public int QFDequeue() throws QFifoException
    {
        if (QFIsEmpty())
            throw new QFifoException(ErrorCode.FIFO_IS_EMPTY);
        QFifoItem first = mHead;
        mHead = first.getNext();
        return first.getKey();
    }

    public void QFClear()
    {
        //mHead = mTail;
        mTail = mHead;
        mHead.setNext( null );
    }
}
