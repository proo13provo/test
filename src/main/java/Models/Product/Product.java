package Models.Product;

public class Product {
    public int id;
    public String name;
    public String fileName1;
    public String fileName2;
    public double priceMin;
    public double priceMax;

    public Product(int id, String name, String fileName1, String fileName2, double priceMin, double priceMax) {
        this.id = id;
        this.name = name;
        this.fileName1 = fileName1;
        this.fileName2 = fileName2;
        this.priceMin = priceMin;
        this.priceMax = priceMax;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getFileName1() {
        return fileName1;
    }

    public String getFileName2() {
        return fileName2;
    }

    public double getPriceMin() {
        return priceMin;
    }

    public double getPriceMax() {
        return priceMax;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", fileName1='" + fileName1 + '\'' +
                ", fileName2='" + fileName2 + '\'' +
                ", priceMin=" + priceMin +
                ", priceMax=" + priceMax +
                '}';
    }
}
