package Models.cart;

import java.io.Serializable;

public class CartProduct implements Serializable {
    private int productId;
    public String id;
    public String name;
    public double price;
    public int quantity;
    public String img;
    public int weight;
    public double total;
    public double sale;
    public double rawTotal;

    public double getRawTotal() {
        return rawTotal;
    }

    public int getProductId() {
        return productId;
    }

    public double getSale() {
        return sale;
    }

    // Constructor
    public CartProduct(String id, String name, double price, int quantity, String img, int weight, double total,double sale) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.img = img;
        this.weight = weight;
        this.total = total;
        this.sale = sale;
    }

    @Override
    public String toString() {
        return "CartProduct{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", quantity=" + quantity +
                ", img='" + img + '\'' +
                ", weight=" + weight +
                ", total=" + total +
                '}';
    }

    // Getters (phải tuân theo JavaBeans)
    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getImg() {
        return img;
    }

    public int getWeight() {
        return weight;
    }

    public double getTotal() {
        return total;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public void setSale(double sale) {
        this.sale = sale;
    }

    public void setRawTotal(double rawTotal) {
        this.rawTotal = rawTotal;
    }
}