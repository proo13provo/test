package Models.Category;

public class CategoryDetail {
    public int id;
    public String name;

    public int getQuantity() {
        return quantity;
    }

    public int quantity;

    public CategoryDetail(int id, String name,int quantity) {
        this.id = id;
        this.name = name;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }
}
