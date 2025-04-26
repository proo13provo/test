package Services;

import Dao.ConnDB;
import Dao.RoleDao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ServiceRole {
   RoleDao roleDao = new RoleDao();
    public String getRoleNameById(int idRole) {

        return roleDao.getRoleNameById(idRole);
    }
}
