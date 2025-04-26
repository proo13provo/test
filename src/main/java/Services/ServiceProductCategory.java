package Services;

import Dao.ConnDB;
import Dao.ProductCategoryDao;
import Models.Product.ListProduct;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ServiceProductCategory {
    public ConnDB dao = new ConnDB();
    ProductCategoryDao productCategoryDao = new ProductCategoryDao();
    public ListProduct getProductCategory(int idCategory, int page, int productsPerPage) throws SQLException {
        return productCategoryDao.getProductCategory(idCategory, page, productsPerPage);
    }
    public int getTotalProducts(int idCategory) throws SQLException {
        return productCategoryDao.getTotalProducts(idCategory);
    }
    public ListProduct getProductCategorySimilar(int idCategory) throws SQLException {
    return productCategoryDao.getProductCategorySimilar(idCategory);
    }

    public static void main(String[] args) throws SQLException {
        ServiceProductCategory s = new ServiceProductCategory();
        System.out.println(s.getTotalProducts(4));
    }
    }


