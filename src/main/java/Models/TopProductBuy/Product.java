package Models.TopProductBuy;

import java.io.Serializable;

public class Product implements Serializable {
    public int productId;       // Mã sản phẩm
    public String productName;  // Tên sản phẩm
    public int totalSold;       // Tổng số lượng bán
    public int minPrice;        // Giá thấp nhất
    public int maxPrice;        // Giá cao nhất
    public String image;

    public Product(int productId, String productName, int totalSold, int minPrice, int maxPrice, String image) {
        this.productId = productId;
        this.productName = productName;
        this.totalSold = totalSold;
        this.minPrice = minPrice;
        this.maxPrice = maxPrice;
        this.image = image;
    }

    public Product(int productId, String productName,  int minPrice, int maxPrice,String image) {
        this.productId = productId;
        this.productName = productName;
        this.image = image;
        this.minPrice = minPrice;
        this.maxPrice = maxPrice;
    }

    public int getId() {
        return productId;
    }

    public String getName() {
        return productName;
    }

    public int getTotalSold() {
        return totalSold;
    }

    public int getMinPrice() {
        return minPrice;
    }

    public int getMaxPrice() {
        return maxPrice;
    }

    public String getImage() {
        return image;
    }

    @Override
    public String toString() {
        return "Product{" +
                "productId=" + productId +
                ", productName='" + productName + '\'' +
                ", totalSold=" + totalSold +
                ", minPrice=" + minPrice +
                ", maxPrice=" + maxPrice +
                ", image='" + image + '\'' +
                '}';
    }
}
