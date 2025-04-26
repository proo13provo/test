package Dao;

import Models.Shipping.Shipping;
import Models.Shipping.Shippingdetail;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ShippingDao {
    ConnDB dao = new ConnDB();
    Shipping shipping = new Shipping() ;
    public boolean addShipping(String name, double shippingfee) throws SQLException {
        for (Shippingdetail s:
                shipping.getItems()) {
            if(s.getName().equals(name)){
                return  false;
            }
        }

        String sql = "INSERT INTO Shipping (name, shippingfee)" +
                "VALUES (?,?)";
        PreparedStatement preparedStatement = dao.conn.prepareStatement(sql);
        preparedStatement.setString(1,name);
        preparedStatement.setDouble(2,shippingfee);
        int rowsInserted =preparedStatement.executeUpdate();
        if (rowsInserted > 0) {
            System.out.println("Thêm dịch vụ giao hàng thành công !");
            return true;
        }
        return false;
    }
    public Shipping getShipping() throws SQLException {
        Shipping shipping = new Shipping();

        String sql = "select id,name , shippingfee  from Shipping";
        PreparedStatement preparedStatement  = dao.conn.prepareStatement(sql);

        ResultSet rs  = preparedStatement.executeQuery();
        while (rs.next()){

            shipping.addShipping(rs.getInt("id"),rs.getString("name"), rs.getDouble("shippingfee"));



        }
        return shipping;
    }

    public static void main(String[] args) throws SQLException {
        ShippingDao s = new ShippingDao();
        System.out.println(s.getShipping());
    }
}
