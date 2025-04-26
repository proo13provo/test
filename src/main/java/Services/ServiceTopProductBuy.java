package Services;

import Dao.ConnDB;
import Dao.TopListBuyProductDao;
import Models.TopProductBuy.Product;
import Models.TopProductBuy.TopProduct;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ServiceTopProductBuy {
    ConnDB dao = new ConnDB();
    TopListBuyProductDao topListBuyProductDao = new TopListBuyProductDao();
    public TopProduct getTop5BestSellingProducts() throws SQLException, SQLException {

        return topListBuyProductDao.getTop5BestSellingProducts();
    }

    public static void main(String[] args) throws SQLException {
        ServiceTopProductBuy s = new ServiceTopProductBuy();
        TopProduct pro = s.getTop5BestSellingProducts();
        System.out.println(pro.getItems().get(0).toString());
    }
}
