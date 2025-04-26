package Services;

import Dao.AddOrUpdateProductDao;
import Dao.ConnDB;

import java.sql.*;
import java.time.LocalDate;

public class ServiceAddProduct {
     ConnDB dao = new ConnDB();
     AddOrUpdateProductDao addOrUpdateProductDao = new AddOrUpdateProductDao();

    public int addOrUpdateProduct(String productName, String productCategory, String productSupplier, String productStatus) throws SQLException, SQLException {
      return   addOrUpdateProductDao.addOrUpdateProduct(dao.getConn(), productName, productCategory, productSupplier, productStatus);
    }

    public int addProductVariant(int productId, float weight, double price, String description, int quantity) throws SQLException {
       return addOrUpdateProductDao.addProductVariant(dao.getConn(), productId, weight, price, description, quantity);
    }

    public void addSale(int variantId, int salePercent, String saleStartDate, String saleEndDate) throws SQLException {
       addOrUpdateProductDao.addSale(dao.getConn(), variantId, salePercent, saleStartDate, saleEndDate);
    }

    public void addImage(int productId, String imagePath) throws SQLException {
       addOrUpdateProductDao.addImage(dao.getConn(), productId, imagePath);
    }

    public static void main(String[] args) {
        ServiceAddProduct s = new ServiceAddProduct();
        System.out.println(s.dao);
    }
}
