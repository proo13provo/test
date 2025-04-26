package Dao;

import Models.inforTransaction.Product;
import Models.inforTransaction.Transaction;
import Models.inforTransaction.TransactionHistory;
import Services.ServiceProduct;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class TransactionHistoryDao {
    ConnDB dao = new ConnDB();
    public void selectTransactionHistory(int idUser, Transaction transaction) throws SQLException {
       OrderDao orderDao = new OrderDao();
        String query = "SELECT * FROM transactionHistory WHERE idUser = ?";


        PreparedStatement stmt = dao.conn.prepareStatement(query) ;

        stmt.setInt(1, idUser); // Thay idUser bằng giá trị thực tế
        // Thay idOrder bằng giá trị thực tế

        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            // Xử lý dữ liệu trong kết quả
            int id = rs.getInt("idHistory");
            Date transactionDate = rs.getDate("transactionDate");
            int idOder = rs.getInt("idOrder");
            float totalPrice = rs.getFloat("totalPrice");
            String paymentMethod = rs.getString("paymentMethod");
            String shippingAddress = rs.getString("shippingAddress");
            List<Product> products = orderDao.getOrderDetailsByIdOrder(idOder);
            transaction.addTransactionHistory(new TransactionHistory(id,transactionDate,totalPrice,idOder,idUser,paymentMethod,shippingAddress,products));

            System.out.println("ID: " + id);
            System.out.println("IdOrder: " + idOder);
            System.out.println("Transaction Date: " + transactionDate);
            System.out.println("Total Price: " + totalPrice);
            System.out.println("Payment Method: " + paymentMethod);
            System.out.println("Shipping Address: " + shippingAddress);
            System.out.println(products.toString());

        }

    }
    public int saveTransactionHistory(int userId, int orderId, double totalPrice, String paymentMethod, String shippingAddress) throws SQLException {
        String sql = "INSERT INTO transactionHistory (transactionDate, totalPrice, idOrder, idUser, paymentMethod, shippingAddress) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = dao.conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            // Lấy transactionDate = createDate + 4 ngày
            String transactionDate = getReceiveDate(userId, orderId);
            if (transactionDate == null) {
                throw new SQLException("Không tìm thấy ngày tạo đơn hàng!");
            }

            // Gán các giá trị cho PreparedStatement
            stmt.setDate(1, Date.valueOf(transactionDate));
            stmt.setDouble(2, totalPrice);
            stmt.setInt(3, orderId);
            stmt.setInt(4, userId);
            stmt.setString(5, paymentMethod);
            stmt.setString(6, shippingAddress);

            stmt.executeUpdate();

            // Lấy ID của giao dịch vừa được tạo
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1); // Trả về ID giao dịch
            }
        }
        return -1;
    }
    public String getReceiveDate(int idUser, int idOrder) throws SQLException {
        String sql = "SELECT createDate FROM orders WHERE idUser = ? AND id = ?";

        try (PreparedStatement stmt = dao.conn.prepareStatement(sql)) {
            stmt.setInt(1, idUser);
            stmt.setInt(2, idOrder);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Date createDate = rs.getDate("createDate");
                if (createDate != null) {
                    // Cộng thêm 4 ngày
                    LocalDate receiveDate = createDate.toLocalDate().plusDays(4);
                    return receiveDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")); // Trả về chuỗi định dạng
                }
            }
        }
        return null; // Trả về null nếu không tìm thấy dữ liệu
    }

    public static void main(String[] args) throws SQLException {
        TransactionHistoryDao s = new TransactionHistoryDao();
        s.selectTransactionHistory(31, new Transaction());
    }
}
