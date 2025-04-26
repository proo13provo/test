package Services;

import Dao.ConnDB;
import Dao.SupplierDao;
import Models.Supplier.Supplier;
import Models.Supplier.SupplierDetail;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceAddSupplier {
    ConnDB dao = new ConnDB();
    SupplierDao supplierDao = new SupplierDao();
    public boolean addSupplier(String supplierName,String contactInfo, String address,int isActive ) throws SQLException {
        return supplierDao.addSupplier(supplierName,contactInfo,address,isActive);
    }
    public Supplier getSupplier() throws SQLException {
        return supplierDao.getSupplier();
        }
    }


