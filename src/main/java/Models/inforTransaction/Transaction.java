package Models.inforTransaction;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Transaction implements Serializable {
    public List<TransactionHistory> items = new ArrayList<>();

    public List<TransactionHistory> getItems() {
        return items;
    }
    public void addTransactionHistory(TransactionHistory tran){
        items.add(tran);
    }
}
