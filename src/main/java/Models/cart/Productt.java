package Models.cart;

public class Productt {

    public String id;
    public String name;
    public int quantity;
    private String imgProduct;
    public int weight;
    public double price;
    public double sale;

    public double getSale() {
        return sale;
    }

    public String getImg() {
        return imgProduct;
    }

    public int getWeight() {
        return weight;
    }

    public double totalPrice;

    @Override
    public String toString() {
        return "Productt{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", quantity=" + quantity +
                ", imgProduct='" + imgProduct + '\'' +
                ", weight=" + weight +
                ", price=" + price +
                ", sale=" + sale +
                ", totalPrice=" + totalPrice +
                '}';
    }

    public Productt(String id, String name, int quantity, String imgProduct, int weight, double price, double totalPrice, double sale) {
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.imgProduct = imgProduct;
        this.weight = weight;
        this.price = price;
        this.totalPrice = totalPrice;
        this.sale = sale;
    }

    public String getName() {
        return name;
    }

    public String getId() {
        return id;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getTotal() {
        return totalPrice;
    }
}
