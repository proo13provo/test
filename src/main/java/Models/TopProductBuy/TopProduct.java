package Models.TopProductBuy;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class TopProduct implements Serializable {
    private List<Product> items;

    // Constructor để khởi tạo danh sách sản phẩm
    public TopProduct() {
        this.items = new ArrayList<>();
    }

    // Phương thức để thêm một sản phẩm vào danh sách
    public void addProduct(Product product) {
        this.items.add(product);
    }

    // Phương thức để cập nhật sản phẩm trong danh sách theo productId
    public boolean updateProduct(int productId, String productName, int totalSold, int minPrice, int maxPrice, String image) {
        // Tìm sản phẩm theo productId và cập nhật thông tin
        for (Product product : items) {
            if (product.getId() == productId) {
                product.productName = productName;
                product.totalSold = totalSold;
                product.minPrice = minPrice;
                product.maxPrice = maxPrice;
                product.image = image;
                return true; // Cập nhật thành công
            }
        }
        return false; // Không tìm thấy sản phẩm để cập nhật
    }

    // Phương thức để lấy danh sách sản phẩm
    public List<Product> getItems() {
        return items;
    }

}
