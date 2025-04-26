package Dao;

import Models.OrderManage.ListOrder;
import Models.OrderManage.Order;
import Models.cart.Cart;
import Models.cart.CartProduct;
import Models.inforTransaction.Product;
import Models.inforTransaction.Transaction;
import Models.inforTransaction.TransactionHistory;
import Services.ServiceProduct;

import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {
    ConnDB dao = new ConnDB();

    public int saveOrder(int userId, Double totalPrice, String receiveAddress, int shippingId) throws SQLException {
        String sql = "INSERT INTO orders (idUser, totalPrice, isPaid, createDate, receiveDate, receiveAddress, isActive, idShipping) " +
                "VALUES (?, ?, 0, NOW(), NULL, ?, 1, ?)";
        try (PreparedStatement stmt = dao.conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, userId);
            stmt.setDouble(2, totalPrice);
            stmt.setString(3, receiveAddress);
            stmt.setInt(4, shippingId);

            stmt.executeUpdate();

            // Lấy ID đơn hàng vừa được tạo
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1); // Trả về ID đơn hàng
            }
        }

        return -1;
    }

    public void saveOrderDetails(int orderId, Cart cart) throws SQLException {
        System.out.println(cart.getItems());
        String sql = "INSERT INTO order_details (idOrder, idProduct, quantity, price,nameProduct,weight,imageURL) VALUES (?, ?, ?, ?,?,?,?)";
        try (PreparedStatement stmt = dao.conn.prepareStatement(sql)) {
            for (CartProduct item : cart.getItems()) {
                stmt.setInt(1, orderId);
                stmt.setInt(2, Integer.parseInt(item.getId()));
                stmt.setInt(3, item.getQuantity());
                stmt.setDouble(4, item.getPrice());
                stmt.setString(5, item.getName());
                stmt.setDouble(6,item.getWeight());
                stmt.setString(7, item.getImg());

                stmt.addBatch(); // Thêm vào batch
            }
            stmt.executeBatch(); // Thực hiện batch
        }
    }

    public List<Product> getOrderDetailsByIdOrder(int idOrder) throws SQLException {
        List<Product> products = new ArrayList<>();

        String query = "SELECT \n" +
                "    order_details.*, \n" +
                "    orders.*, \n" +
                "    products.*, \n" +
                "    MIN(Images.imageData) AS image_url\n" +
                 ""+
                "FROM order_details\n" +
                "INNER JOIN orders ON orders.id = order_details.idOrder\n" +
                "INNER JOIN products ON order_details.idProduct = products.id\n" +
                "INNER JOIN Images ON Images.idProduct = products.id\n" +
                "WHERE order_details.idOrder = ?\n" +
                "GROUP BY order_details.id, orders.id, products.id;\n";


        PreparedStatement preparedStatement = dao.conn.prepareStatement(query);

        // Thiết lập giá trị cho tham số `idOrder`
        preparedStatement.setInt(1, idOrder);

        try (ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                // Lấy thông tin từ kết quả truy vấn
                int id = resultSet.getInt("id");
                int idProduct = resultSet.getInt("idProduct");
                int quantity = resultSet.getInt("quantity");
                int price = resultSet.getInt("price");
                String nameProduct = resultSet.getString("nameProduct");
                double weight = resultSet.getDouble("weight");
                String image = resultSet.getString("image_url");
                boolean isRated = resultSet.getBoolean("isRated");

                // Tạo đối tượng Product và thêm vào danh sách
                products.add(new Product(id, idOrder, idProduct, quantity, price, nameProduct,image,weight,isRated));

                System.out.println(weight);
                System.out.println(isRated);
            }
        }
        return products;
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

    public String paymentMethod(String idUser, String idOrder) throws SQLException {
        String sql = "Select methodPayment from Payment where idUser = ? and idOrder = ?";
        String payment = "";
        try (PreparedStatement stmt = dao.conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, idUser);
            stmt.setString(2, idOrder);

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



    public boolean updateOrderStatus(int orderId, String status) throws SQLException {
        ConnDB dao = new ConnDB();
        String query = "UPDATE orders SET isActive = ? WHERE id = ?";
        boolean statusUpdate = status.equals("active");
        try (Connection conn = dao.getConn();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setBoolean(1, statusUpdate);
            pstmt.setInt(2, orderId);
            return pstmt.executeUpdate() > 0;
        }
    }

    public boolean deleteOrder(int orderId) throws SQLException {
        ConnDB dao = new ConnDB();
        String query = "DELETE FROM orders WHERE id = ?";
        try (Connection conn = dao.getConn();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, orderId);
            return pstmt.executeUpdate() > 0;
        }
    }

    public ListOrder getAllOrders() throws SQLException {
        ListOrder items = new ListOrder();


        ConnDB dao = new ConnDB();

        String sql = "SELECT \n" +
                "    o.id AS order_id,\n" +
                "    o.idUser,\n" +
                "    u.userName,  -- Thêm tên người dùng từ bảng users\n" +
                "    o.totalPrice,\n" +
                "    o.isPaid,\n" +
                "    o.createDate,\n" +
                "    o.receiveDate,\n" +
                "    o.receiveAddress,\n" +
                "    o.isActive,  -- Thêm trường isActive từ bảng orders\n" +
                "    GROUP_CONCAT(\n" +
                "        p.productName\n" +
                "        SEPARATOR '; '\n" +
                "    ) AS order_details\n" +
                "FROM orders o\n" +
                "JOIN order_details od ON o.id = od.idOrder\n" +
                "JOIN products p ON od.idProduct = p.id\n" +
                "JOIN users u ON o.idUser = u.id  -- JOIN thêm bảng users để lấy tên người dùng\n" +
                "GROUP BY o.id, o.idUser, u.userName, o.totalPrice, o.isPaid, o.createDate, o.receiveDate, o.receiveAddress, o.isActive;  -- Thêm u.userName vào GROUP BY";

        try (PreparedStatement preparedStatement = dao.conn.prepareStatement(sql)) {
            // Thực thi truy vấn
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int orderId = resultSet.getInt("order_id");
                    int idUser = resultSet.getInt("idUser");
                    String nameUser = resultSet.getString("userName");
                    int totalPrice = resultSet.getInt("totalPrice");
                    boolean isPaid = resultSet.getBoolean("isPaid");
                    Date createDate = resultSet.getDate("createDate");
                    Date receiveDate = resultSet.getDate("receiveDate");
                    String receiveAddress = resultSet.getString("receiveAddress");
                    String orderDetails = resultSet.getString("order_details");
                    int isActive = resultSet.getInt("isActive");
                    items.addOrder(new Order(orderId,idUser,totalPrice,isPaid,createDate,receiveAddress,isActive,orderDetails,nameUser));


                    // In hoặc xử lý kết quả
                    System.out.println("Order ID: " + orderId + ", User ID: " + idUser + ", Total Price: " + totalPrice + isPaid + createDate + receiveDate + receiveAddress +"Tran g"+ isActive + orderDetails ) ;

                }
            }
        }
        return items;
    }
    public ListOrder getOrdersByUserId(int userId) throws SQLException {
        ListOrder items = new ListOrder();
        ConnDB dao = new ConnDB();
        String query = "SELECT id, idUser, totalPrice, isPaid, createDate, receiveDate, receiveAddress, isActive FROM orders WHERE idUser = ?";

        try (PreparedStatement preparedStatement = dao.conn.prepareStatement(query)) {
            // Gán giá trị tham số cho idUser
            preparedStatement.setInt(1, userId);

            // Thực thi truy vấn
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    int idUser = resultSet.getInt("idUser");
                    int totalPrice = resultSet.getInt("totalPrice");
                    boolean isPaid = resultSet.getBoolean("isPaid");
                    Date createDate = resultSet.getDate("createDate");
                    String receiveAddress = resultSet.getString("receiveAddress");
                    boolean isActive = resultSet.getBoolean("isActive");

                   // items.addOrder(new Order(id,idUser,totalPrice,isPaid,createDate,receiveAddress,isActive,));
                    // In hoặc xử lý kết quả
                    System.out.println("Order ID: " + id + ", User ID: " + idUser + ", Total Price: " + totalPrice);
                }
            }
        }
        return items;
    }
    public ListOrder getOrderById(int idOrder) throws SQLException {
        ListOrder items = new ListOrder();


        ConnDB dao = new ConnDB();

        String sql = "SELECT \n" +
                "    o.id AS order_id,\n" +
                "    o.idUser,\n" +
                "    u.userName,  -- Thêm tên người dùng từ bảng users\n" +
                "    o.totalPrice,\n" +
                "    o.isPaid,\n" +
                "    o.createDate,\n" +
                "    o.receiveDate,\n" +
                "    o.receiveAddress,\n" +
                "    o.isActive,  -- Thêm trường isActive từ bảng orders\n" +
                "    GROUP_CONCAT(\n" +
                "        p.productName\n" +
                "        SEPARATOR '; '\n" +
                "    ) AS order_details\n" +
                "FROM orders o\n" +
                "JOIN order_details od ON o.id = od.idOrder\n" +
                "JOIN products p ON od.idProduct = p.id\n" +
                "JOIN users u ON o.idUser = u.id  -- JOIN thêm bảng users để lấy tên người dùng\n" +
                "WHERE  o.id= ?   -- Điều kiện lọc theo idUser\n" +
                "GROUP BY o.id, o.idUser, u.userName, o.totalPrice, o.isPaid, o.createDate, o.receiveDate, o.receiveAddress, o.isActive;  -- Thêm u.userName vào GROUP BY";

        try (PreparedStatement preparedStatement = dao.conn.prepareStatement(sql)) {
            preparedStatement.setInt(1, idOrder);
            // Thực thi truy vấn
            try (ResultSet resultSet = preparedStatement.executeQuery()) {

                while (resultSet.next()) {
                    int orderId = resultSet.getInt("order_id");
                    int idUser = resultSet.getInt("idUser");
                    String nameUser = resultSet.getString("userName");
                    int totalPrice = resultSet.getInt("totalPrice");
                    boolean isPaid = resultSet.getBoolean("isPaid");
                    Date createDate = resultSet.getDate("createDate");
                    Date receiveDate = resultSet.getDate("receiveDate");
                    String receiveAddress = resultSet.getString("receiveAddress");
                    String orderDetails = resultSet.getString("order_details");
                    int isActive = resultSet.getInt("isActive");
                    items.addOrder(new Order(orderId,idUser,totalPrice,isPaid,createDate,receiveAddress,isActive,orderDetails,nameUser));


                    // In hoặc xử lý kết quả
                    System.out.println("Order ID: " + orderId + ", User ID: " + idUser + ", Total Price: " + totalPrice + isPaid + createDate + receiveDate + receiveAddress +"Tran g"+ isActive + orderDetails ) ;

                }
            }
        }
        return items;
    }
    public boolean updateOrderStatus(int id, int isActive) {
        ConnDB dao = new ConnDB();
        String query = "UPDATE orders SET isActive = ? WHERE id = ?";

        try (Connection connection = dao.getConn();  // Kết nối DB
             PreparedStatement statement = connection.prepareStatement(query)) {

            // Set các tham số cho PreparedStatement
            statement.setInt(1, isActive); // Tham số 1: isActive
            statement.setInt(2, id);           // Tham số 2: id của đơn hàng

            // Thực thi câu lệnh cập nhật
            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated > 0) {
                return true; // Cập nhật thành công
            } else {
                return false; // Không tìm thấy đơn hàng hoặc không thay đổi gì
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Lỗi xảy ra trong quá trình cập nhật
        }
    }

    public static void main(String[] args) throws SQLException {
        OrderDao s = new OrderDao();
        //s.getAllOrders();
        System.out.println(s.getOrderDetailsByIdOrder(86).toString());    }
}




