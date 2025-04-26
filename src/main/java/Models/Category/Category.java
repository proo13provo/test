package Models.Category;

import java.util.ArrayList;
import java.util.List;

public class Category {
    List<CategoryDetail> items = new ArrayList<>();
    public void addCategory(int id, String name,int quantity){
        items.add(new CategoryDetail(id,name,quantity));
    }

    public List<CategoryDetail> getItems() {
        return items;
    }
}
