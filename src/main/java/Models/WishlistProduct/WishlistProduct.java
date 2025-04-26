package Models.WishlistProduct;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class WishlistProduct implements Serializable {
    public List<Product> items = new ArrayList<>();

    public List<Product> getItems() {
        return items;
    }
    public void addProductWishlist(Product pro){

        items.add(pro);
    }
}
