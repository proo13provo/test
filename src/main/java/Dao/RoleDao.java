package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RoleDao {
    ConnDB dao = new ConnDB();
    public String getRoleNameById(int idRole) {
        String sql = "SELECT roleName FROM roles WHERE id = ?";
        try (PreparedStatement statement = dao.conn.prepareStatement(sql)) {
            statement.setInt(1, idRole);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getString("roleName");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
