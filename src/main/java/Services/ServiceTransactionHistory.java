package Services;

import Dao.TransactionHistoryDao;
import Models.inforTransaction.Transaction;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ServiceTransactionHistory {
    TransactionHistoryDao transactionHistoryDao = new TransactionHistoryDao();
    public void selectTransactionHistory(int idUser, Transaction transaction) throws SQLException {
transactionHistoryDao.selectTransactionHistory(idUser,transaction);

    }
    public int saveTransactionHistory(int userId, int orderId, double totalPrice, String paymentMethod, String shippingAddress) throws SQLException {

        return transactionHistoryDao.saveTransactionHistory(userId, orderId, totalPrice, paymentMethod, shippingAddress);
    }

    public static void main(String[] args) throws SQLException {
        Transaction transaction = new Transaction();
        ServiceTransactionHistory s = new ServiceTransactionHistory();
        s.selectTransactionHistory(1,transaction);
    }
}
