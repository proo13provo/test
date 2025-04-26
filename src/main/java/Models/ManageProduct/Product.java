package Models.ManageProduct;

import java.io.Serializable;

public class Product implements Serializable {
    public int id;
    public String name;
    public double price;
    public double weight;
    public int quantity;
    public String image;
    public String productDescription;
    public String supplierName;
    public String category;
    public String state;
    public int isActive;

    public String getState() {
        return state;
    }





    public Product(int id, String name, double price, double weight, int quantity, String image, String productDescription, String supplierName, String category, int isActive,String state) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.weight = weight;
        this.quantity = quantity;
        this.image = image;
        this.productDescription = productDescription;
        this.supplierName = supplierName;
        this.category = category;
        this.isActive = isActive;
        this.state = state;
    }

    public Product(int id, String name, double price, double weight, int quantity, String image, String productDescription, String supplierName, String category) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.weight = weight;
        this.quantity = quantity;
        this.image = image;
        this.productDescription = productDescription;
        this.supplierName = supplierName;
        this.category = category;
    }

    public Product() {
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public double getWeight() {
        return weight;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getImage() {
        return image;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public String getCategory() {
        return category;
    }

    public int getIsActive() {
        return isActive;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", weight=" + weight +
                ", quantity=" + quantity +
                ", image='" + image + '\'' +
                ", productDescription='" + productDescription + '\'' +
                ", supplierName='" + supplierName + '\'' +
                ", category='" + category + '\'' +
                ", state='" + state + '\'' +
                ", isActive=" + isActive +
                '}';
    }

    public static void main(String[] args) {


    }
}