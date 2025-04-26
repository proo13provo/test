package Models.Shipping;

public class Shippingdetail {
    public int id;
    public String name;
    public double price;

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public int getId() {
        return id;
    }

    public Shippingdetail(int id , String name, double price) {
        this.id = id;
        this.name = name;
        this.price = price;
    }

    @Override
    public String toString() {
        return "Shippingdetail{" +
                "name='" + name + '\'' +
                ", price=" + price +
                '}';
    }
}
