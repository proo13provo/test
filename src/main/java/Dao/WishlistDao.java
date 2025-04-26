package Dao;

import Models.WishlistProduct.Product;
import Models.WishlistProduct.WishlistProduct;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WishlistDao {
    ConnDB dao = new ConnDB();

    public boolean addWishlist(int idUser, int idProduct) throws SQLException {

        String sql = "INSERT INTO wishlists (idUser, idProduct, addDate) VALUES (?, ?, NOW())";

             PreparedStatement stmt = dao.conn.prepareStatement(sql) ;

            stmt.setInt(1, idUser);
            stmt.setInt(2, idProduct);

            int rowsAffected = stmt.executeUpdate();
           if(rowsAffected > 0){
               return true;
           }
           return false;
    }
    public WishlistProduct selectWishlist(int idUser) throws SQLException {
     WishlistProduct wishlistProduct = new WishlistProduct();

        String sql = "SELECT \n" +
                "    w.idProduct, \n" +
                "    p.productName, \n" +
                "    MAX(w.addDate) AS addDate,  -- Lấy ngày thêm mới nhất\n" +
                "    (SELECT i.imageData \n" +
                "     FROM Images i \n" +
                "     WHERE i.idProduct = w.idProduct \n" +
                "     LIMIT 1) AS imageData  -- Lấy ảnh đầu tiên của sản phẩm\n" +
                "FROM \n" +
                "    wishlists w\n" +
                "JOIN \n" +
                "    products p ON w.idProduct = p.id\n" +
                "WHERE \n" +
                "    w.idUser = ?  -- Thay '?' bằng idUser yêu cầu\n" +
                "GROUP BY \n" +
                "    w.idProduct, p.productName\n" +
                "ORDER BY \n" +
                "    addDate DESC;"
                ;

        PreparedStatement stmt = dao.conn.prepareStatement(sql);
        stmt.setInt(1, idUser);

Product pro;
        ResultSet rs = stmt.executeQuery();
        String image = null;
        while (rs.next()) {
            int idProduct1 = rs.getInt("idProduct");
            String name = rs.getString("productName");
            Date date = rs.getDate("addDate");
            image = rs.getString("imageData");
            System.out.println("Product Details:");
            System.out.println("ID: " + idProduct1);
            System.out.println("Name: " + name);
            System.out.println("Date Added: " + date);
            System.out.println("Image Data: " + image);
            pro = new Product(idProduct1,image,name,date);
            wishlistProduct.addProductWishlist(pro);
        }


        return wishlistProduct;
    }

    public static void main(String[] args) throws SQLException {
        WishlistDao s = new WishlistDao();
        System.out.println(s.selectWishlist(3).toString());

    }
}
