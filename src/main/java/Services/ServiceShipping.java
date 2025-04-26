package Services;


import Dao.ShippingDao;
import Models.Shipping.Shipping;



import java.sql.SQLException;

public class ServiceShipping {
  ShippingDao shippingDao = new ShippingDao();
    public boolean addShipping(String name, double shippingfee) throws SQLException {

        return shippingDao.addShipping(name, shippingfee);
    }
public Shipping getShipping() throws SQLException {

    return shippingDao.getShipping();
}
    public static void main(String[] args) throws SQLException {
        ServiceShipping s = new ServiceShipping();
        System.out.println(s.getShipping().getItems().size());
    }
}
