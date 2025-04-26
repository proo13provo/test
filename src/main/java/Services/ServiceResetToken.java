package Services;

import Dao.ResetTokenDao;
import Models.User.User;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.sql.SQLException;
import java.util.UUID;

public class ServiceResetToken {
    private ResetTokenDao resetTokenDao = new ResetTokenDao();
    public static String generateResetToken() {
        SecureRandom random = new SecureRandom();
        return new BigInteger(130, random).toString(32);

    }
    public boolean saveResetToken(int userId, String token) throws SQLException{
       return resetTokenDao.saveResetToken(userId, token);

    }
    public String generateRandomToken() {
        return UUID.randomUUID().toString();
    }
    public User getUserByToken(String token){
        return resetTokenDao.getUserByToken(token);
    }
    public  void deleteResetToken(String token) throws SQLException{
        resetTokenDao.deleteResetToken(token);
    }
}
