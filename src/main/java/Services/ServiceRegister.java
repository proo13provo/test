package Services;

import Dao.ConnDB;
import Models.DecodePass.PasswordUtil;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ServiceRegister  {
    ConnDB dao = new ConnDB();
    public boolean checkRegister(String email) throws SQLException {

        PreparedStatement ps = dao.conn.prepareStatement(
                "select * from users where email = ? "
        );
        ps.setString(1,email);
        ResultSet rs = ps.executeQuery();
        while (rs.next()){
            System.out.println(rs.getString("email"));
            return false;
        }

        return true;
    }
//    public boolean addAccount(String email, String userPassword, String userName, String phoneNumber) throws SQLException {
//        PasswordUtil decode = new PasswordUtil();
//if(checkRegister(email)){
//  // String decodePass =  decode.hashPassword(userPassword);
//    String sql = "INSERT INTO users (" +
//            "email, userPassword, userName, phoneNumber,idRole) " +
//            "VALUES (?, ?, ?, ?,?)";
//    PreparedStatement preparedStatement = dao.conn.prepareStatement(sql);
//    preparedStatement.setString(1, email);              // email
//    preparedStatement.setString(2, decodePass);           // userPassword (mã hóa trước)
//    preparedStatement.setString(3, userName);                       // userName
//    preparedStatement.setString(4, phoneNumber);
//    preparedStatement.setInt(5,1);// phoneNumber
////    preparedStatement.setDate(5, birthDate);         // birthDate (YYYY-MM-DD)
////    preparedStatement.setString(6, companyName);                // companyName
////    preparedStatement.setString(7, address);   // address
////    preparedStatement.setString(8, image);         // image
////    preparedStatement.setInt(9, 100);                                 // point
////    preparedStatement.setInt(10, 1);                                  // idFavoriteProduct
////    preparedStatement.setInt(11, 1);                                  // idRole
////    preparedStatement.setTimestamp(12, new java.sql.Timestamp(System.currentTimeMillis())); // createDate
////    preparedStatement.setBoolean(13, true);                           // isActive
//
//    // Thực thi câu lệnh INSERT
//    int rowsInserted =preparedStatement.executeUpdate();
//    if (rowsInserted > 0) {
//        System.out.println("Thêm người dùng thành công!");
//        return true;
//    }
//
//
//}
//        return false;
//    }
    public int getID(String email) throws SQLException {
        int id = 0;
        String sql = "select id from users where email = ? ";
        PreparedStatement preparedStatement  = dao.conn.prepareStatement(sql);
        preparedStatement.setString(1,email);
        ResultSet rs  = preparedStatement.executeQuery();
        while (rs.next()){
            id =  rs.getInt("id");
        }
        return id;
    }

    public static void main(String[] args) throws SQLException {
        ServiceRegister s = new ServiceRegister();
        System.out.println(s.checkRegister("alex.smith@example.com"));
        System.out.println(s.getID("alex.smith@example.com"));
    }
}
