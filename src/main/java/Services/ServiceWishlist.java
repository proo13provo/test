package Services;

import Dao.WishlistDao;
import Models.WishlistProduct.Product;
import Models.WishlistProduct.WishlistProduct;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ServiceWishlist {
  WishlistDao wishlistDao = new WishlistDao();
    public boolean addWishlist(int idUser, int idProduct) throws SQLException {

        return wishlistDao.addWishlist(idUser,idProduct);
    }
    public WishlistProduct selectWishlist(int idUser) throws SQLException {
      return   wishlistDao.selectWishlist(idUser);

    }
}
