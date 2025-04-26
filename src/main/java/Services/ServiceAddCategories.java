package Services;

import Dao.CategoryDao;
import Dao.ConnDB;
import Models.Category.Category;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ServiceAddCategories {
    ConnDB dao = new ConnDB();
    CategoryDao categoryDao = new CategoryDao();
    public boolean addCategories(String categoryName , String categoryDescription) throws SQLException {


    return categoryDao.addCategories(categoryName, categoryDescription);
    }
    public Category getCategories() throws SQLException {

    return categoryDao.getCategories();
    }
}
