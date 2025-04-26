package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PaymentDao {
    ConnDB dao = new ConnDB();
    public String paymentMethod(String idUser, int idOrder) throws SQLException {
        String sql = "Select methodPayment from Payment where idUser = ? and idOrder = ?";
        String payment = "";
        try (PreparedStatement stmt = dao.conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1,idUser);
            stmt.setInt(2,idOrder);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    payment = rs.getString("methodPayment");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();

        }

        // Lấy ID của giao dịch vừa được tạo

        return payment;

    }
    public boolean insertPayment(int idUser, int idOrder, String methodPayment) throws SQLException {
        String sql = "INSERT INTO Payment (idUser, idOrder, methodPayment) VALUES (?, ?, ?)";
        PreparedStatement preparedStatement = dao.conn.prepareStatement(sql);

        preparedStatement.setInt(1, idUser);
        preparedStatement.setInt(2, idOrder);
        preparedStatement.setString(3, methodPayment);
        int rowsInserted = preparedStatement.executeUpdate();
        return rowsInserted > 0;

    }
}
