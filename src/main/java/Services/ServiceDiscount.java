package Services;

import Dao.DiscountDao;
import Models.Discount.Discount;

import java.sql.SQLException;
import java.util.List;

public class ServiceDiscount {
    private DiscountDao discountDao = new DiscountDao();
    public List<Discount> getDiscountsByUserRank(int userId) throws SQLException {
        return discountDao.getDiscountsByUserRank(userId);
    }
    public Discount getDiscountByUserRank(String discountCode, int userId) throws SQLException{
        return discountDao.getDiscountByUserRank(discountCode, userId);
    }
    }
