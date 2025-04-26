package Models.OrderManage;

import java.util.ArrayList;
import java.util.List;

public class ListOrder {
    public List<Order> items = new ArrayList<>();

    public List<Order> getItems() {
        return items;
    }
    public void addOrder(Order order){
        items.add(order);
    }
}
