package Dao;

import Models.TopProductBuy.Product;
import Models.TopProductBuy.TopProduct;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TopListBuyProductDao {
    ConnDB dao = new ConnDB();
    public TopProduct getTop5BestSellingProducts() throws SQLException, SQLException {
        TopProduct topProducts  = new TopProduct();
        String query = """
        SELECT 
            od.idProduct AS ProductID,
            od.nameProduct AS ProductName,
            SUM(od.quantity) AS TotalSold,
            MIN(od.price) AS MinPrice,
            MAX(od.price) AS MaxPrice,
            img1.imageData AS Image1
            
        FROM
            order_details od
        JOIN products p ON od.idProduct = p.id
        LEFT JOIN (
            SELECT i1.idProduct, i1.imageData
            FROM Images i1
            WHERE (
                SELECT COUNT(*) 
                FROM Images i2 
                WHERE i2.idProduct = i1.idProduct AND i2.id <= i1.id
            ) = 1
        ) img1 ON p.id = img1.idProduct
        LEFT JOIN (
            SELECT i1.idProduct, i1.imageData
            FROM Images i1
            WHERE (
                SELECT COUNT(*) 
                FROM Images i2 
                WHERE i2.idProduct = i1.idProduct AND i2.id <= i1.id
            ) = 2
        ) img2 ON p.id = img2.idProduct
        GROUP BY 
            od.idProduct, od.nameProduct, img1.imageData, img2.imageData
        ORDER BY 
            TotalSold DESC
        LIMIT 5;
    """;

        try (PreparedStatement stmt = dao.conn.prepareStatement(query);
             ResultSet resultSet = stmt.executeQuery()) {

            while (resultSet.next()) {
                int productId = resultSet.getInt("ProductID");
                String productName = resultSet.getString("ProductName");
                int totalSold = resultSet.getInt("TotalSold");
                int minPrice = resultSet.getInt("MinPrice");
                int maxPrice = resultSet.getInt("MaxPrice");
                String image1 = resultSet.getString("Image1");


                topProducts.addProduct(new Product(productId, productName,totalSold,  minPrice, maxPrice,image1));
            }
        }
        return topProducts;
    }

    public static void main(String[] args) throws SQLException {
        TopListBuyProductDao s = new TopListBuyProductDao();
        for (int i = 0; i < s.getTop5BestSellingProducts().getItems().size(); i++) {
            System.out.println(s.getTop5BestSellingProducts().getItems().get(i).toString());
        }

    }
}
