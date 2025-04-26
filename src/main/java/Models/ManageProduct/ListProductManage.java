package Models.ManageProduct;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class ListProductManage  implements Serializable {
    public List<Product> items = new ArrayList<>();

    public void addProduct(Product product) {
        items.add(product);
    }

    public boolean removeProductById(int id) {
        return items.removeIf(product -> product.id == id);
    }

    public List<Product> getItems(){
        return items;
    }

}
