package Models.inforTransaction;

import java.sql.Date;
import java.util.List;

public class TransactionHistory {
    private int id; // Mã giao dịch
    private Date transactionDate; // Ngày giao dịch
    private float totalPrice; // Tổng giá tiền
    private int idOrder; // Mã đơn hàng
    private int idUser; // Mã người dùng
    private String paymentMethod; // Phương thức thanh toán
    private String shippingAddress; // Địa chỉ giao hàng

    public List<Product> getProducts() {
        return products;
    }

    private List<Product> products;

    public TransactionHistory(int id, Date transactionDate, float totalPrice, int idOrder, int idUser, String paymentMethod, String shippingAddress, List<Product> products) {
        this.id = id;
        this.transactionDate = transactionDate;
        this.totalPrice = totalPrice;
        this.idOrder = idOrder;
        this.idUser = idUser;
        this.paymentMethod = paymentMethod;
        this.shippingAddress = shippingAddress;
        this.products = products;
    }

    public int getId() {
        return id;
    }

    public Date getTransactionDate() {
        return transactionDate;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public int getIdOrder() {
        return idOrder;
    }

    public int getIdUser() {
        return idUser;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }
}
