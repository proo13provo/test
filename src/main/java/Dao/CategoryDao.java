package Dao;

import Models.Category.Category;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CategoryDao {
    ConnDB dao = new ConnDB();
    ProductCategoryDao productCategoryDao = new ProductCategoryDao();
    public boolean addCategories(String categoryName , String categoryDescription) throws SQLException {
        String sql = "INSERT INTO categories (name, description) VALUES (?, ?)";


        PreparedStatement pstmt = dao.conn.prepareStatement(sql);

        // Thiết lập giá trị cho các tham số
        pstmt.setString(1, categoryName);
        pstmt.setString(2, categoryDescription);

        // Thực thi câu lệnh
        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
            System.out.println("Thêm dữ liệu thành công!");
            return true;
        }

        return false;
    }
    public Category getCategories() throws SQLException {
        Category item = new Category();
        String query = "SELECT id, name FROM categories";
        PreparedStatement preparedStatement = dao.conn.prepareStatement(query);
        ResultSet resultSet = preparedStatement.executeQuery();

        // In kết quả truy vấn

        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            System.out.println(id + "\t" + name);
            int quantity = productCategoryDao.getTotalProducts(id);
            item.addCategory(id, name,quantity);
        }
        return item;
    }
}
