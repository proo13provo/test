package Dao;

import Models.ListUser.ListUser;
import Models.User.User;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    public int check(String email, String pass) throws SQLException {
        ConnDB dao = new ConnDB();
        int userId = -1;
        String query = "SELECT id FROM users WHERE email = ? AND userPassword = ? AND isActive = 1";
        PreparedStatement stmt = dao.conn.prepareStatement(query) ;

        stmt.setString(1, email);
        stmt.setString(2, pass);

        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            userId = rs.getInt("id"); // Lấy id của người dùng
        }
        return userId;
    }
    public int checkRole(String email, String pass) throws SQLException {
        ConnDB dao = new ConnDB();
        int idRole = -1;
        String query = "SELECT idRole FROM users WHERE email = ? AND userPassword = ? AND isActive = 1";
        PreparedStatement stmt = dao.conn.prepareStatement(query) ;

        stmt.setString(1, email);
        stmt.setString(2, pass);

        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            idRole = rs.getInt("idRole"); // Lấy id của người dùng
        }
        return idRole;
    }
    public int checkIsAvtive(String email, String pass) throws SQLException {
        ConnDB dao = new ConnDB();
        int isActive = -1;
        String query = "SELECT isActive FROM users WHERE email = ? AND userPassword = ? ";
        PreparedStatement stmt = dao.conn.prepareStatement(query) ;

        stmt.setString(1, email);
        stmt.setString(2, pass);

        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            isActive = rs.getInt("isActive"); // Lấy id của người dùng
        }
        return isActive;
    }
    public boolean checkCredentials(String email, String password) {
        String query = "SELECT * FROM users WHERE email = ? AND userPassword = ?";
        ConnDB dao = new ConnDB();
        try (Connection conn = dao.getConn();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true; // Nếu có kết quả, nghĩa là login hợp lệ
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Không tìm thấy người dùng hoặc mật khẩu không hợp lệ
    }

    public int getUserIdByPhoneNumber(String phoneNumber) throws Exception {
        ConnDB dao = new ConnDB();
        String query = "SELECT id FROM users WHERE phoneNumber = ?";
        int userId = -1;

        try (PreparedStatement stmt = dao.conn.prepareStatement(query)) {
            // Thiết lập giá trị cho tham số trong câu truy vấn
            stmt.setString(1, phoneNumber);

            // Thực thi truy vấn
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    userId = rs.getInt("id");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("Lỗi khi truy vấn id user: " + e.getMessage());
        }

        return userId;
    }
    public boolean createUser(User user) {
        ConnDB dao = new ConnDB();
        String sql = "INSERT INTO users (email, userPassword, userName, phoneNumber, birthDate, companyName, address, image, point, idFavoriteProduct, idRole, createDate, isActive) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = dao.getConn();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getUserPassword());
            stmt.setString(3, user.getUserName());
            stmt.setString(4, user.getPhoneNumber());
            stmt.setDate(5, new java.sql.Date(user.getBirthDate().getTime()));
            stmt.setString(6, user.getCompanyName());
            stmt.setString(7, user.getAddress());
            stmt.setString(8, user.getImage());
            stmt.setInt(9, user.getPoint());
            stmt.setInt(10, user.getIdFavoriteProduct());
            stmt.setInt(11, user.getIdRole());
            stmt.setTimestamp(12, new Timestamp(user.getCreateDate().getTime()));
            stmt.setBoolean(13, user.isActive());

            int result = stmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public User getUserById(int id) {
        ConnDB dao = new ConnDB();
        String sql = "SELECT * FROM users WHERE id = ?";
        try (Connection conn = dao.getConn();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("id"),
                        rs.getString("email"),
                        rs.getString("userPassword"),
                        rs.getString("userName"),
                        rs.getString("phoneNumber"),
                        rs.getDate("birthDate"),
                        rs.getString("companyName"),
                        rs.getString("address"),
                        rs.getString("image"),
                        rs.getInt("point"),
                        rs.getInt("idFavoriteProduct"),
                        rs.getInt("idRole"),
                        rs.getTimestamp("createDate"),
                        rs.getBoolean("isActive")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public  User getUserByIdInfor(int userId) {
        // Thông tin kết nối cơ sở dữ liệu


        // Đối tượng User để lưu kết quả
        User user = null;

        // Câu truy vấn SQL
        String sql = "SELECT email, userName, phoneNumber, birthDate, address, image, createDate " +
                "FROM users " +
                "WHERE id = ?";
ConnDB dao = new ConnDB();
        try (Connection connection = dao.getConn();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            // Gán giá trị cho tham số trong câu lệnh SQL
            ps.setInt(1, userId);

            // Thực thi câu truy vấn
            ResultSet rs = ps.executeQuery();

            // Xử lý kết quả trả về
            if (rs.next()) {
                String email = rs.getString("email");
                String userName = rs.getString("userName");
                String phoneNumber = rs.getString("phoneNumber");
                Date birthDate = rs.getDate("birthDate");
                String address = rs.getString("address");
                String image = rs.getString("image");
                Date createDate = rs.getDate("createDate");

                // Tạo đối tượng User
                user = new User(email, userName, phoneNumber, birthDate, address, image, createDate);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
    public boolean updateUserInfo(int userId, String userName, String phoneNumber, String address, Date birthDate, String image) {
        // Câu truy vấn SQL để cập nhật thông tin người dùng
        String sql = "UPDATE users " +
                "SET userName = ?, phoneNumber = ?, address = ?, birthDate = ?, image = ? " +
                "WHERE id = ?";

        // Đối tượng kết nối
        ConnDB dao = new ConnDB();
        boolean isUpdated = false;

        try (Connection connection = dao.getConn();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            // Gán giá trị cho các tham số trong câu lệnh SQL
            ps.setString(1, userName);
            ps.setString(2, phoneNumber);
            ps.setString(3, address);
            ps.setDate(4, birthDate != null ? new java.sql.Date(birthDate.getTime()) : null); // Convert java.util.Date to java.sql.Date
            ps.setString(5, image);
            ps.setInt(6, userId);

            // Thực thi lệnh cập nhật
            int rowsAffected = ps.executeUpdate();

            // Kiểm tra xem có cập nhật thành công không
            isUpdated = rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isUpdated;
    }
    public List<User> getAllUsers() {
        ConnDB dao = new ConnDB();
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users";
        try (Connection conn = dao.getConn();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                users.add(new User(
                        rs.getInt("id"),
                        rs.getString("email"),
                        rs.getString("userPassword"),
                        rs.getString("userName"),
                        rs.getString("phoneNumber"),
                        rs.getDate("birthDate"),
                        rs.getString("companyName"),
                        rs.getString("address"),
                        rs.getString("image"),
                        rs.getInt("point"),
                        rs.getInt("idFavoriteProduct"),
                        rs.getInt("idRole"),
                        rs.getTimestamp("createDate"),
                        rs.getBoolean("isActive")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
    public boolean addUser(User user) {
        String query = "INSERT INTO users (email, userPassword, userName, phoneNumber, birthDate, companyName, address, image, point, idFavoriteProduct, idRole, createDate, isActive) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        ConnDB dao  = new ConnDB();
        try (Connection conn = dao.getConn();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getUserPassword());
            stmt.setString(3, user.getUserName());
            stmt.setString(4, user.getPhoneNumber());
            stmt.setDate(5, new java.sql.Date(user.getBirthDate().getTime()));
            stmt.setString(6, user.getCompanyName());
            stmt.setString(7, user.getAddress());
            stmt.setString(8, user.getImage());
            stmt.setInt(9, user.getPoint());
            stmt.setInt(10, user.getIdFavoriteProduct());
            stmt.setInt(11, user.getIdRole());
            stmt.setDate(12, new java.sql.Date(user.getCreateDate().getTime()));
            stmt.setBoolean(13, user.isActive());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public  boolean updateUser(User user) {
        ConnDB dao = new ConnDB();
        String sql = "UPDATE users SET email = ?, userPassword = ?, userName = ?, phoneNumber = ?, birthDate = ?, companyName = ?, address = ?, image = ?, point = ?, idFavoriteProduct = ?, idRole = ?, createDate = ?, isActive = ? WHERE id = ?";
        try ( Connection conn = dao.getConn();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getUserPassword());
            stmt.setString(3, user.getUserName());
            stmt.setString(4, user.getPhoneNumber());
            stmt.setDate(5, new java.sql.Date(user.getBirthDate().getTime()));
            stmt.setString(6, user.getCompanyName());
            stmt.setString(7, user.getAddress());
            stmt.setString(8, user.getImage());
            stmt.setInt(9, user.getPoint());
            stmt.setInt(10, user.getIdFavoriteProduct());
            stmt.setInt(11, user.getIdRole());
            stmt.setTimestamp(12, new Timestamp(user.getCreateDate().getTime()));
            stmt.setBoolean(13, user.isActive());
            stmt.setInt(14, user.getId());

            int result = stmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    public ListUser getUsers() {
        ListUser items = new ListUser();
        ConnDB dao = new ConnDB();
        String sql = "SELECT id, email, userName AS name, address, phoneNumber, birthDate, createDate, idRole, isActive FROM users";

        try (Connection connection = dao.getConn();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                int id = resultSet.getInt("id");
               String email = resultSet.getString("email");
               String name = resultSet.getString("name");
               String address = resultSet.getString("address");
                String phoneNumber = resultSet.getString("phoneNumber");
               String birthDate = resultSet.getString("birthDate");
               String createDate = resultSet.getString("createDate");
                int idRole = resultSet.getInt("idRole");
                boolean isActive = resultSet.getBoolean("isActive");

                items.addUser(new Models.ListUser.User(id,email,name,address,phoneNumber,birthDate,createDate,idRole,isActive));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return items;
    }


    public boolean registerUser(User user) {
        ConnDB dao = new ConnDB();
        String sql = "INSERT INTO users (email, userPassword, userName, createDate, isActive,idRole,phoneNumber,isGoogle) VALUES (?, ?, ?, NOW(), false,?,?,false)";
        try (Connection conn = dao.getConn();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getUserPassword());
            stmt.setString(3, user.getUserName());
            stmt.setInt(4,2);
            stmt.setString(5, user.getPhoneNumber());
            int result = stmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean checkPasswordExists(int idUser, String password) {
        ConnDB dao = new ConnDB();
        // Câu truy vấn SQL để kiểm tra mật khẩu với idUser
        String sql = "SELECT COUNT(*) FROM users WHERE id = ? AND userPassword = ?";

        // Kết nối cơ sở dữ liệu
        try (Connection connection = dao.getConn(); // Sử dụng phương thức lấy kết nối của bạn
             PreparedStatement ps = connection.prepareStatement(sql)) {

            // Thiết lập tham số cho câu truy vấn
            ps.setInt(1, idUser); // Gán idUser vào câu truy vấn
            ps.setString(2, password); // Gán mật khẩu vào câu truy vấn

            // Thực thi câu truy vấn
            ResultSet rs = ps.executeQuery();

            // Kiểm tra kết quả
            if (rs.next()) {
                int count = rs.getInt(1); // Lấy kết quả COUNT
                return count > 0; // Nếu COUNT > 0 có nghĩa là tồn tại mật khẩu
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false; // Nếu không có kết quả, trả về false
    }

    public User getUserByEmail(String email) {
        ConnDB dao = new ConnDB();
        String sql = "SELECT * FROM users WHERE email = ?";
        try (Connection conn = dao.getConn();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setEmail(rs.getString("email"));
                    user.setUserPassword(rs.getString("userPassword"));
                    user.setUserName(rs.getString("userName"));
                    user.setCreateDate(rs.getDate("createDate"));
                    user.setActive(rs.getBoolean("isActive"));
                    user.setIdRole(rs.getInt("idRole"));
                    user.setImage(rs.getString("image"));
                  //  user.setGoogle(rs.getBoolean("isGoogle"));
                    return user;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public User getUserByEmail1(String email) {
        ConnDB dao = new ConnDB();
        String sql = "SELECT * FROM users WHERE email = ?";
        try (Connection conn = dao.getConn();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setEmail(rs.getString("email"));
                    user.setUserPassword(rs.getString("userPassword"));
                    user.setUserName(rs.getString("userName"));
                    user.setCreateDate(rs.getDate("createDate"));
                    user.setActive(rs.getBoolean("isActive"));
                    user.setIdRole(rs.getInt("idRole"));
                    return user;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public  boolean updateUser(int id, int idRole, String userName, boolean isActive) {
        ConnDB dao = new ConnDB();

        // Câu lệnh SQL
        String sql = "UPDATE users SET idRole = ?, userName = ?, isActive = ? WHERE id = ?";

        try (Connection connection = dao.getConn();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            // Thiết lập các tham số trong PreparedStatement
            preparedStatement.setInt(1, idRole);            // Đặt idRole
            preparedStatement.setString(2, userName);       // Đặt userName
            preparedStatement.setBoolean(3, isActive);      // Đặt isActive
            preparedStatement.setInt(4, id);                // Đặt id người dùng muốn cập nhật

            // Thực thi câu lệnh cập nhật và trả về true nếu có bản ghi bị ảnh hưởng
            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0; // Trả về true nếu có ít nhất 1 bản ghi được cập nhật
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Trả về false nếu có lỗi
        }
    }
    public  boolean deleteUser(int id) {
        ConnDB dao = new ConnDB();


        // Câu lệnh SQL để xóa người dùng
        String sql = "DELETE FROM users WHERE id = ?";

        try (Connection connection = dao.getConn();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            // Thiết lập tham số id trong PreparedStatement
            preparedStatement.setInt(1, id); // Đặt id người dùng cần xóa

            // Thực thi câu lệnh xóa và trả về true nếu có bản ghi bị xóa
            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0; // Trả về true nếu có ít nhất 1 bản ghi được xóa
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Trả về false nếu có lỗi
        }
    }
    public boolean updatePassword(int userId, String hashedPassword) {
        ConnDB dao = new ConnDB();
        String sql = "UPDATE users SET userPassword = ? WHERE id = ?";
        try (Connection conn = dao.getConn();  // Mở kết nối
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, hashedPassword);
            stmt.setInt(2, userId);

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public  String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hash = md.digest(password.getBytes());
        StringBuilder hexString = new StringBuilder();
        for (byte b : hash) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) hexString.append('0');
            hexString.append(hex);
        }
        return hexString.toString();
    }
    public boolean addUserGG(User user) {
        ConnDB dao = new ConnDB();
        String sql = "INSERT INTO users (email,  userName, image , createDate,idRole,isActive) VALUES (?, ?, ?, NOW(),?, true)";
        try (Connection conn = dao.getConn();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getUserName());
            stmt.setString(3, user.getImage());
            stmt.setInt(4,2);

            int result = stmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean addUserFb(User user) {
        ConnDB dao = new ConnDB();
        String sql = "INSERT INTO users (email,  userName, image , createDate,idRole,isActive,isGoogle) VALUES (?, ?, ?, NOW(),?, true,?)";
        try (Connection conn = dao.getConn();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getUserName());
            stmt.setString(3, user.getImage());
            stmt.setInt(4,2);
            stmt.setBoolean(5,false);

            int result = stmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public String getUserAvatar(int idUser){
        ConnDB dao = new ConnDB();
        String sql = "SELECT image FROM users WHERE id = ?";
        String avatar = null; // Biến lưu ảnh đại diện

        try (Connection conn = dao.getConn();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idUser); // Đổi từ String thành int
            ResultSet rs = stmt.executeQuery(); // Dùng executeQuery()

            if (rs.next()) {
                avatar = rs.getString("image"); // Lấy URL ảnh từ cột "image"
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return avatar; // Trả về URL ảnh hoặc null nếu không có ảnh
    }
    public boolean isUserActiveByEmail(String email){
        String query = "SELECT isActive FROM users WHERE email = ?";
        ConnDB dao = new ConnDB();
        try (Connection conn = dao.getConn();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int active = rs.getInt("isActive"); // Lấy kiểu int thay vì boolean
                return active == 1; // hoặc return active != 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false; // Trả về false nếu không tìm thấy người dùng hoặc có lỗi
    }


    public boolean updateUserActive(String email, boolean isActive) {
        String query = "UPDATE users SET isActive = ? WHERE email = ?";
        ConnDB dao = new ConnDB();

        try (Connection conn = dao.getConn();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, isActive ? 1 : 0); // Chuyển boolean thành 1 (true) hoặc 0 (false)
            stmt.setString(2, email);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0; // Nếu có ít nhất 1 hàng bị ảnh hưởng thì thành công

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false; // Trả về false nếu có lỗi hoặc không cập nhật được
    }

    public static void main(String[] args) throws NoSuchAlgorithmException, SQLException {
       UserDao s = new UserDao();
//       User user = new User("hvunguyen@icloud.com","Hoàng Vũ","https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=3715900748708113&height=200&width=200&ext=1745670652&hash=AbZfIjyUQdW-oHmSgXN6CKYq",2);
//       s.addUserFb(user);
//        System.out.println(s.updateUser(4,2,"YAUSO",false));
       // boolean ui = Boolean.parseBoolean("1");
      //  System.out.println(ui);
        //System.out.println(s.checkIsAvtive("user@gmail.com",h));
        System.out.println(s.isUserActiveByEmail("vue@gmail.com"));

    }

}
