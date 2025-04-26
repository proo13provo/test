package Dao;

import Models.Supplier.Supplier;
import Models.Supplier.SupplierDetail;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SupplierDao {
    ConnDB dao = new ConnDB();
    public boolean addSupplier(String supplierName,String contactInfo, String address,int isActive ) throws SQLException {
        String sql = "INSERT INTO suppliers (supplierName, contactInfo, address, isActive) VALUES (?, ?, ?, ?)";
        PreparedStatement pstmt = dao.conn.prepareStatement(sql);

        // Gắn giá trị cho các tham số
        pstmt.setString(1, supplierName);
        pstmt.setString(2, contactInfo);
        pstmt.setString(3, address);
        pstmt.setInt(4, isActive);

        // Thực thi câu lệnh
        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
            System.out.println("Thêm dữ liệu thành công!");
            return true;
        }
        return false;
    }
    public Supplier getSupplier() throws SQLException {
        Supplier item = new Supplier();
        List<SupplierDetail> result = new ArrayList<>();
        String query = "SELECT id, supplierName FROM suppliers where isActive = ?";
        boolean isActive = true;
        PreparedStatement preparedStatement = dao.conn.prepareStatement(query);
        preparedStatement.setBoolean(1, isActive);
        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String supplierName = resultSet.getString("supplierName");
            item.addSupplier(id, supplierName);
        }

        return item;
    }
}
