package Models.Products;

public class ProductDetail {
    public int id;
    public int idCategory;

    public int getIdCategory() {
        return idCategory;
    }

    public ProductDetail(int id, int idCategory, String name, double minPrice, double maxPrice, String image1, String image2, String image3, String image4, String description) {
        this.id = id;
        this.idCategory = idCategory;
        this.name = name;
        this.minPrice = minPrice;
        this.maxPrice = maxPrice;
        this.image1 = image1;
        this.image2 = image2;
        this.image3 = image3;
        this.image4 = image4;
        this.description = description;
    }

    public String name;
    public double minPrice;
    public double maxPrice;
    public String image1;
    public String image2;
    public String image3;
    public String image4;
    public String description;

    public ProductDetail(int id, String name, double minPirce, double maxPrice, String image1, String image2, String image3, String image4, String description) {
        this.id = id;
        this.name = name;
        this.minPrice = minPirce;
        this.maxPrice = maxPrice;
        this.image1 = image1;
        this.image2 = image2;
        this.image3 = image3;
        this.image4 = image4;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public double getMinPrice() {
        return minPrice;
    }

    public double getMaxPrice() {
        return maxPrice;
    }

    public String getImage1() {
        return image1;
    }

    public String getImage2() {
        return image2;
    }

    public String getImage3() {
        return image3;
    }

    public String getImage4() {
        return image4;
    }

    public String getDescription() {
        return description;
    }
}
