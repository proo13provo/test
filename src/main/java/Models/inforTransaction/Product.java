package Models.inforTransaction;

public class Product {
    private int id;
    private int idOrder;
    private int idProduct;
    private int quantity;
    private int price;
    private String nameProduct;
    private String imageURL;
    private double weight;
    private boolean isRated;

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", idOrder=" + idOrder +
                ", idProduct=" + idProduct +
                ", quantity=" + quantity +
                ", price=" + price +
                ", nameProduct='" + nameProduct + '\'' +
                ", imageURL='" + imageURL + '\'' +
                ", weight=" + weight +
                ", isRated=" + isRated +
                '}';
    }

    public boolean isRated() {
        return isRated;
    }

    public void setRated(boolean rated) {
        isRated = rated;
    }

    public Product(int id, int idOrder, int idProduct, int quantity, int price, String nameProduct, String imageURL, double weight, boolean isRated) {
        this.id = id;
        this.idOrder = idOrder;
        this.idProduct = idProduct;
        this.quantity = quantity;
        this.price = price;
        this.nameProduct = nameProduct;
        this.imageURL = imageURL;
        this.weight = weight;
        this.isRated = isRated;
    }

    public Product(int id, int idOrder, int idProduct, int quantity, int price, String nameProduct) {
        this.id = id;
        this.idOrder = idOrder;
        this.idProduct = idProduct;
        this.quantity = quantity;
        this.price = price;
        this.nameProduct = nameProduct;
    }

    public int getId() {
        return id;
    }

    public int getIdOrder() {
        return idOrder;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getPrice() {
        return price;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public Product(int id, int idOrder, int idProduct, int quantity, int price, String nameProduct, String imageURL, double weight) {
        this.id = id;
        this.idOrder = idOrder;
        this.idProduct = idProduct;
        this.quantity = quantity;
        this.price = price;
        this.nameProduct = nameProduct;
        this.imageURL = imageURL;
        this.weight = weight;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

}