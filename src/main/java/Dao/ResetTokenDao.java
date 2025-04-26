package Dao;

import Models.User.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ResetTokenDao {
    ConnDB dao = new ConnDB();
    private static final int TOKEN_EXPIRATION_MINUTES = 15;

    public boolean saveResetToken(int userId, String token) {
        boolean isSaved = false;
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = dao.getConn(); // Kết nối tới cơ sở dữ liệu
            String sql = "INSERT INTO password_resets (user_id, reset_token, created_at, expires_at) " +
                    "VALUES (?, ?, NOW(), DATE_ADD(NOW(), INTERVAL ? MINUTE))";

            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setString(2, token);
            stmt.setInt(3, TOKEN_EXPIRATION_MINUTES); // TOKEN_EXPIRATION_MINUTES là số phút token sẽ hết hạn

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                isSaved = true; // Nếu có ít nhất 1 dòng bị ảnh hưởng, trả về true
            }
        } catch (SQLException e) {
            e.printStackTrace(); // In ra lỗi nếu có
        } finally {
            // Đảm bảo đóng tài nguyên
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return isSaved; // Trả về true nếu token được lưu thành công, false nếu không
    }


    public  void deleteResetToken(String token) throws SQLException {
        Connection  conn = dao.getConn();
        String sql = "DELETE FROM password_resets WHERE reset_token = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, token);
            stmt.executeUpdate();
        }

    }
    public User getUserByToken(String token) {
        String sql = "SELECT u.* FROM users u " +
                "JOIN password_resets t ON u.id = t.user_id " +
                "WHERE t.reset_token = ? AND t.expires_at > NOW()";

        try (Connection conn = dao.getConn();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, token);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Trả về người dùng nếu token hợp lệ
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUserName(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
