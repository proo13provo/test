package Dao;

import java.sql.*;
import java.time.LocalDate;

public class AddOrUpdateProductDao {
    public int addOrUpdateProduct(Connection conn, String productName, String productCategory, String productSupplier, String productStatus) throws SQLException {
        String sqlCheckProduct = "SELECT id FROM products WHERE productName = ?";
        try (PreparedStatement psCheck = conn.prepareStatement(sqlCheckProduct)) {
            psCheck.setString(1, productName);
            try (ResultSet rs = psCheck.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("id");
                }
            }
        }

        String sqlProduct = "INSERT INTO products (productName, idCategory, idSupplier, isActive) VALUES (?, ?, ?, ?)";
        try (PreparedStatement psProduct = conn.prepareStatement(sqlProduct, PreparedStatement.RETURN_GENERATED_KEYS)) {
            psProduct.setString(1, productName);
            psProduct.setString(2, productCategory);
            psProduct.setString(3, productSupplier);
            psProduct.setBoolean(4, "Còn hàng".equals(productStatus));
            psProduct.executeUpdate();

            try (ResultSet rsProduct = psProduct.getGeneratedKeys()) {
                if (rsProduct.next()) {
                    return rsProduct.getInt(1);
                }
            }
        }

        throw new SQLException("Không thể tạo sản phẩm.");
    }

    public int addProductVariant(Connection conn, int productId, float weight, double price, String description, int quantity) throws SQLException {
        String sqlVariant = "INSERT INTO product_variants (idProduct, weight, price, isActive, productDescription, importDate, quantity) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement psVariant = conn.prepareStatement(sqlVariant, PreparedStatement.RETURN_GENERATED_KEYS)) {
            psVariant.setInt(1, productId);
            psVariant.setFloat(2, weight);
            psVariant.setDouble(3, price);
            psVariant.setBoolean(4, true);
            psVariant.setString(5, description);
            psVariant.setDate(6, Date.valueOf(LocalDate.now()));
            psVariant.setInt(7, quantity);
            psVariant.executeUpdate();

            try (ResultSet rsVariant = psVariant.getGeneratedKeys()) {
                if (rsVariant.next()) {
                    return rsVariant.getInt(1);
                }
            }
        }

        throw new SQLException("Không thể tạo biến thể sản phẩm.");
    }

    public void addSale(Connection conn, int variantId, int salePercent, String saleStartDate, String saleEndDate) throws SQLException {
        String sqlSale = "INSERT INTO sales (idVariant, salePercent, saleStartDate, saleEndDate) VALUES (?, ?, ?, ?)";
        try (PreparedStatement psSale = conn.prepareStatement(sqlSale)) {
            psSale.setInt(1, variantId);
            psSale.setInt(2, salePercent);
            psSale.setDate(3, Date.valueOf(saleStartDate));
            psSale.setDate(4, Date.valueOf(saleEndDate));
            psSale.executeUpdate();
        }
    }

    public void addImage(Connection conn, int productId, String imagePath) throws SQLException {
        String sqlImage = "INSERT INTO images (idProduct, imageData) VALUES (?, ?)";
        try (PreparedStatement psImage = conn.prepareStatement(sqlImage)) {
            psImage.setInt(1, productId);
            psImage.setString(2, imagePath);
            psImage.executeUpdate();
        }
    }
}