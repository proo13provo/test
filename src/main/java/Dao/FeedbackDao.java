package Dao;

import Models.Feedback.Feedback;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FeedbackDao {
    ConnDB con = new ConnDB();
    public List<Feedback> getFeedbacksByProductId(int productId) throws SQLException {
        List<Feedback> feedbackList = new ArrayList<>();
        String query = "SELECT f.id AS feedback_id, f.comment, f.create_date, f.rating_rank, f.status,\n" +
                "       od.nameProduct, u.userName, u.birthDate, u.phoneNumber,\n" +
                "       fi.image_url\n" +
                "FROM feedbacks f\n" +
                "LEFT JOIN order_details od ON od.id = f.id_order_detail\n" +
                "INNER JOIN orders ON orders.id = od.idOrder\n" +
                "INNER JOIN users u ON u.id = orders.idUser\n" +
                "LEFT JOIN products p ON p.id = od.idProduct\n" +
                "LEFT JOIN feedback_images fi ON fi.feedback_id = f.id\n" +
                "WHERE p.id = ?";

        try (Connection conn = con.getConn();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            Map<Integer, Feedback> feedbackMap = new HashMap<>();

            stmt.setInt(1, productId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int feedbackId = rs.getInt("feedback_id");

                Feedback feedback = feedbackMap.get(feedbackId);
                if (feedback == null) {
                    feedback = new Feedback();
                    feedback.setComment(rs.getString("comment"));
                    feedback.setCreateDate(rs.getDate("create_date"));
                    feedback.setRatingRank(rs.getInt("rating_rank"));
                    feedback.setStatus(rs.getString("status"));
                    feedback.setNameProduct(rs.getString("nameProduct"));
                    feedback.setUserName(rs.getString("userName"));
                    feedback.setBirthDate(rs.getDate("birthDate"));
                    feedback.setPhoneNumber(rs.getString("phoneNumber"));
                    feedback.setReviewImages(new ArrayList<>());
                    feedbackMap.put(feedbackId, feedback);
                }

                String imageUrl = rs.getString("image_url");
                if (imageUrl != null && !imageUrl.isEmpty()) {
                    feedback.getReviewImages().add(imageUrl);
                }
            }

            return new ArrayList<>(feedbackMap.values());
        }
    }
    public int getIdOrderDetails(String idOrder, String idProduct) {
        String sql = "SELECT order_details.id " +
                "FROM order_details " +
                "INNER JOIN orders ON orders.id = order_details.idOrder " +
                "WHERE orders.id = ? AND order_details.idProduct = ?;";

        int id = -1; // Default value to indicate no result
        try (Connection conn = con.getConn();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, idOrder);
            stmt.setString(2, idProduct);

            try (ResultSet rs = stmt.executeQuery()) {
                // Kiểm tra nếu có kết quả trả về
                if (rs.next()) {
                    id = rs.getInt(1); // Lấy giá trị từ cột đầu tiên
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }
    public int insertReview(String comment, int idOrderDetail, int ratingRank, String status) {
        String sql = "INSERT INTO feedbacks (comment, create_date, id_order_detail, rating_rank, status) VALUES (?, ?, ?, ?, ?)";
        int generatedId = -1;

        if (!isRated(idOrderDetail)) {
            try (Connection conn = con.getConn();
                 PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

                stmt.setString(1, comment);
                stmt.setDate(2, new java.sql.Date(System.currentTimeMillis()));
                stmt.setInt(3, idOrderDetail);
                stmt.setInt(4, ratingRank);
                stmt.setString(5, status);

                int rowsInserted = stmt.executeUpdate();
                updateIsRated(idOrderDetail);

                if (rowsInserted > 0) {
                    ResultSet rs = stmt.getGeneratedKeys();
                    if (rs.next()) {
                        generatedId = rs.getInt(1);
                        System.out.println("Thêm đánh giá thành công! ID: " + generatedId);
                    }
                } else {
                    System.out.println("Thêm đánh giá thất bại.");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return generatedId;
    }

    public  void insertFeedbackImage(int feedbackId, String imageUrl) throws SQLException {
        ConnDB dao = new ConnDB();
        String sql = "INSERT INTO feedback_images (feedback_id, image_url) VALUES (?, ?)";

        try (
                Connection conn = dao.getConn();// lấy kết nối
                PreparedStatement stmt = conn.prepareStatement(sql);
        ) {
            stmt.setInt(1, feedbackId);
            stmt.setString(2, imageUrl);

            stmt.executeUpdate();
        }
    }
    public void updateIsRated(int idOrderDetail) {
        // Câu lệnh SQL để cập nhật trạng thái "Đã đánh giá"
        String sql = "UPDATE order_details SET isRated = ? WHERE id = ?";
        ConnDB dao = new ConnDB();

        try (Connection conn = dao.getConn();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Thiết lập giá trị cho câu lệnh SQL
            stmt.setBoolean(1, true);  // Cập nhật cột "isRated" thành true
            stmt.setInt(2, idOrderDetail);  // Truyền idOrder_detail vào câu lệnh SQL

            // Thực thi câu lệnh SQL
            int rowsAffected = stmt.executeUpdate();

        } catch (SQLException e) {
            // Xử lý lỗi (ví dụ: in ra thông báo lỗi)
            e.printStackTrace();
        }
    }
    public boolean isRated(int idOrderDetail) {
        ConnDB con = new ConnDB();
        String sql = "SELECT isRated FROM order_details WHERE id = ?";

        try (Connection conn = con.getConn();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Thiết lập giá trị idOrderDetail vào câu lệnh SQL
            stmt.setInt(1, idOrderDetail);

            // Thực thi truy vấn và lấy kết quả
            ResultSet rs = stmt.executeQuery();

            // Kiểm tra xem có dòng nào được trả về không
            if (rs.next()) {
                // Lấy giá trị của cột isRated
                return rs.getBoolean("isRated");
            }

            // Nếu không có dòng nào, trả về false (chưa đánh giá)
            return false;

        } catch (SQLException e) {
            // Xử lý lỗi
            e.printStackTrace();
            return false;
        }
    }


    public static void main(String[] args) throws SQLException {
        FeedbackDao f = new FeedbackDao();
        System.out.println(f.getFeedbacksByProductId(46).toString());
     //   int id = f.insertReview("ádkajhsdkjahskdjhas",37,5,"Mới");
      //  System.out.println(id);
    }
}
