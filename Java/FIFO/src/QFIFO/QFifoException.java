package QFIFO;

public class QFifoException extends Throwable
{
    private final QFIFO.ErrorCode mErrorCode;

    QFifoException(QFIFO.ErrorCode errCode)
    {
        mErrorCode = errCode;
    }

    public String getReason()
    {
        switch (mErrorCode)
        {
            case FIFO_ALLOC_ERROR:
                return "Alloc error";
            case FIFO_IS_EMPTY:
                return "Fifo is empty";
            default:
                return "Other error";
        }
    }
}
