package Services;

import Dao.ConnDB;
import Dao.OrderDao;
import Dao.PaymentDao;
import Models.OrderManage.ListOrder;
import Models.OrderManage.Order;
import Models.cart.Cart;
import Models.cart.CartProduct;
import Models.inforTransaction.Product;
import Models.inforTransaction.Transaction;
import Models.inforTransaction.TransactionHistory;

import javax.management.Query;
import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class ServiceOrder {
    ConnDB dao = new ConnDB();
    OrderDao orderDao = new OrderDao();
    PaymentDao paymentDao = new PaymentDao();

    public boolean insertPayment(int idUser, int idOrder, String methodPayment) throws SQLException {
        return orderDao.insertPayment(idUser, idOrder, methodPayment);

    }
    public int saveOrder(int userId, Double totalPrice, String receiveAddress, int shippingId) throws SQLException {

        return orderDao.saveOrder(userId, totalPrice, receiveAddress, shippingId);
    }
    public List<Product> getOrderDetailsByIdOrder(int idOrder) throws SQLException {

        return orderDao.getOrderDetailsByIdOrder(idOrder);
    }
    public void saveOrderDetails(int orderId, Cart cart) throws SQLException {
       orderDao.saveOrderDetails(orderId, cart);
    }
    public String getReceiveDate(int idUser, int idOrder) throws SQLException {

        return orderDao.getReceiveDate(idUser, idOrder);
    }
    public String paymentMethod(String idUser, int idOrder) throws SQLException {


        return paymentDao.paymentMethod(idUser,idOrder);

    }
    public ListOrder getAllOrders() throws SQLException {

        return orderDao.getAllOrders();
    }
    public ListOrder getOrdersByUserId(int userId) throws SQLException {

        return orderDao.getOrdersByUserId(userId);
    }

    public  boolean updateOrderStatus(int orderId, String status) throws SQLException {
     return orderDao.updateOrderStatus(orderId, status);
    }

    public  boolean deleteOrder(int orderId) throws SQLException {
        return orderDao.deleteOrder(orderId);
    }
    public ListOrder getOrderById(int idOrder) throws SQLException {
      return orderDao.getOrderById(idOrder);
    }
    public boolean updateOrderStatus(int id, int isActive) {
    return orderDao.updateOrderStatus(id, isActive);
    }

        }


