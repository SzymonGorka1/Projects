package QTFIFO;

public class QFifoException extends Exception
{
    private final ErrorCode mErrorCode;

    QFifoException(ErrorCode errCode)
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
            case FIFO_SIZE_NEGATIVE:
                return "Size is negative";
            default:
                return "Other error";
        }
    }
}
