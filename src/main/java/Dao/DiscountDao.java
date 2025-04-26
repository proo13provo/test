package Dao;

import Models.Discount.Discount;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DiscountDao {
    ConnDB dao = new ConnDB();
    public List<Discount> getDiscountsByUserRank(int userId) throws SQLException {
        Connection connection = dao.getConn();
        List<Discount> discounts = new ArrayList<>();

        String query = "SELECT d.* FROM discounts d " +
                "JOIN discount_user_ranks dur ON d.id = dur.discount_id " +
                "JOIN users u ON dur.user_rank_id = u.idRank " +
                "WHERE u.id = ? " +
                "AND d.isActive = 1 " +
                "AND CURDATE() BETWEEN d.startDate AND d.endDate";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userId);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Discount discount = new Discount();
                    discount.setId(resultSet.getInt("id"));
                    discount.setDiscountCode(resultSet.getString("discountCode"));
                    discount.setDiscountPercentage(resultSet.getDouble("discountPercentage"));
                    discount.setDiscountAmount(resultSet.getDouble("discountAmount"));
                    discount.setStartDate(resultSet.getTimestamp("startDate"));
                    discount.setEndDate(resultSet.getTimestamp("endDate"));
                    discount.setActive(resultSet.getBoolean("isActive"));
                    discount.setMinOrderAmount(resultSet.getDouble("minOrderAmount"));

                    discounts.add(discount);
                }
            }
        }

        return discounts;
    }
    public Discount getDiscountByUserRank(String discountCode, int userId) throws SQLException {
        Connection connection = dao.getConn();
        String query = "SELECT d.* FROM discounts d " +
                "JOIN discount_user_ranks dur ON d.id = dur.discount_id " +
                "JOIN users u ON dur.user_rank_id = u.idRank " +
                "WHERE d.discountCode = ? " +  // Điều kiện lọc theo discountCode
                "AND d.isActive = 1 " +
                "AND CURDATE() BETWEEN d.startDate AND d.endDate " +
                "AND u.id = ?"; // Kiểm tra người dùng với userId

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            // Thiết lập tham số cho câu truy vấn
            statement.setString(1, discountCode);
            statement.setInt(2, userId);  // Thêm tham số userId

            Discount discount = null;
            try (ResultSet resultSet = statement.executeQuery()) {
                // Lấy dữ liệu từ kết quả truy vấn
                if (resultSet.next()) {
                    discount = new Discount();
                    discount.setId(resultSet.getInt("id"));
                    discount.setDiscountCode(resultSet.getString("discountCode"));
                    discount.setDiscountPercentage(resultSet.getDouble("discountPercentage"));
                    discount.setDiscountAmount(resultSet.getDouble("discountAmount"));
                    discount.setStartDate(resultSet.getTimestamp("startDate"));
                    discount.setEndDate(resultSet.getTimestamp("endDate"));
                    discount.setActive(resultSet.getBoolean("isActive"));
                    discount.setMinOrderAmount(resultSet.getDouble("minOrderAmount"));
                }
            }
            return discount;  // Trả về đối tượng Discount hoặc null nếu không tìm thấy
        }
    }



    public static void main(String[] args) throws SQLException {
        DiscountDao discountDao = new DiscountDao();
        System.out.println(discountDao.getDiscountsByUserRank(31).toString());
        System.out.println(discountDao.getDiscountByUserRank("VIP20",31));
    }
}

