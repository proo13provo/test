package Models.Product;

import java.util.ArrayList;
import java.util.List;

public class ListProduct {
    List<Product> items = new ArrayList<>();
public void addProduct(int id, String name, String fileName1, String fileName2, double priceMin, double priceMax ){
    items.add(new Product(id, name, fileName1,fileName2,priceMin,priceMax));
}

    public List<Product> getItems() {
        return items;
    }
}
