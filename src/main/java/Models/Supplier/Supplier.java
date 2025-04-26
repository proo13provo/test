package Models.Supplier;

import java.util.ArrayList;
import java.util.List;

public class Supplier {
    public List<SupplierDetail> items = new ArrayList<>();
    public void addSupplier(int id, String name){
        items.add(new SupplierDetail(id, name));
    }

    public List<SupplierDetail> getItems() {
        return items;
    }
}
