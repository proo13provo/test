package Models.Products;

import java.util.ArrayList;
import java.util.List;

public class Products {
    public List<ProductDetail> items= new ArrayList<>();
    public void addProduct(int id,int idCategory, String name, double minPirce, double maxPrice, String image1, String image2, String image3, String image4, String description){
        items.add(new ProductDetail(id,idCategory,name,minPirce,maxPrice,image1,image2,image3,image4,description));
    }

    public List<ProductDetail> getItems() {
        return items;
    }
}
