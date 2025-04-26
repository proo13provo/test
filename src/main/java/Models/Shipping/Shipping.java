package Models.Shipping;

import java.util.ArrayList;
import java.util.List;

public class Shipping {
    public List<Shippingdetail> shippingdetailList = new ArrayList<>();
    public void addShipping(int id,String name, double price){
        shippingdetailList.add(new Shippingdetail(id,name, price));
    }

    public List<Shippingdetail> getItems() {
        return shippingdetailList;
    }
}
