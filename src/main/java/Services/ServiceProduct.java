package Services;

import Dao.ConnDB;
import Dao.ProductDao;
import Models.ManageProduct.ListProductManage;
import Models.ManageProduct.Product;
import Models.Product.ListProduct;
import Models.TopProductBuy.TopProduct;
import Models.cart.Productt;
import Models.cart.CartProduct;
import Models.cart.Cart;
import Models.inforTransaction.Transaction;
import Models.inforTransaction.TransactionHistory;
import Models.Products.Products;
import Sercurity.ProductFilter;

import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;


public class ServiceProduct {
    List<CartProduct> productList = new ArrayList<>();
    private ConnDB dao = new ConnDB();
    ProductDao productDao = new ProductDao();

    public List<CartProduct> getProductList(double weight) throws SQLException {

        return productDao.getProductList(weight);
    }
    public CartProduct getById(String id, int weight) throws SQLException {

        return productDao.getById(id, weight);
    }
    public int getProductVariantCountByIdAndWeight(int productId, float weight) {
        return productDao.getProductVariantCountByIdAndWeight(productId, weight);
    }

    public int getUserIdByPhoneNumber(String phoneNumber) throws Exception {
        String query = "SELECT id FROM users WHERE phoneNumber = ?";
        int userId = -1;

        try (PreparedStatement stmt = dao.conn.prepareStatement(query)) {
            // Thiết lập giá trị cho tham số trong câu truy vấn
            stmt.setString(1, phoneNumber);

            // Thực thi truy vấn
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    userId = rs.getInt("id");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("Lỗi khi truy vấn id user: " + e.getMessage());
        }

        return userId;
    }



public ListProduct getListProduct() throws SQLException {

    return productDao.getListProduct();

    }
    public int getTotalProducts() throws SQLException {
        return productDao.getTotalProducts();
    }

    public ListProduct getListProductByPage(int page, int itemsPerPage) throws SQLException {

        return productDao.getListProductByPage(page,itemsPerPage);
    }
    public Products getProductDetail(String idProduct) throws SQLException {

        return productDao.getProductDetail(idProduct);
    }
    public ListProduct getFilteredProducts(String filterType, int page, int itemsPerPage) throws SQLException {
        return productDao.getFilteredProducts(filterType, page, itemsPerPage);
    }
    public int getCategoryProductCounts(String categoryName) throws SQLException {
        return productDao.getCategoryProductCounts(categoryName);
    }
    public ListProductManage getAllProducts() throws SQLException {

        return productDao.getAllProducts();
    }
    public boolean updateProduct(int idProduct, double price, int quantity, String productDescription, double weight,
                                 boolean isActive) {
       return productDao.updateProduct(idProduct, price, quantity, productDescription, weight, isActive);
    }
    public void deleteProductVariant(int idProduct, float weight) throws SQLException {
       productDao.deleteProductVariant(idProduct,weight);
    }
    public ListProduct searchProductsByName(String productName) throws SQLException {
        return productDao.searchProductsByName(productName);
    }
    public TopProduct getLatestProducts() {
        return productDao.getLatestProducts();
    }
    public ListProduct getProductsByPriceRange(double minPrice, double maxPrice) throws SQLException {
        return productDao.getProductsByPriceRange(minPrice, maxPrice);
    }
    public void updateProductAndVariant(int idProduct, double weight, double price, int quantity,
                                        String productDescription, int idCategory, int idSupplier, int isActive) throws SQLException {
        productDao.updateProductAndVariant(idProduct, weight, price, quantity, productDescription, idCategory, idSupplier, isActive);

    }
    public ListProduct filterProducts(ProductFilter filter) {
        ListProduct listProduct = new ListProduct();
        StringBuilder sql = new StringBuilder("SELECT DISTINCT p.* FROM Products p WHERE 1=1");
        List<Object> params = new ArrayList<>();

        if (filter.getSearchQuery() != null && !filter.getSearchQuery().trim().isEmpty()) {
            sql.append(" AND p.productName LIKE ?");  // Sửa từ p.name thành p.productName
            params.add("%" + filter.getSearchQuery() + "%");
        }

        if (filter.getCategory() != null && !filter.getCategory().trim().isEmpty()) {
            sql.append(" AND p.idCategory = ?");
            params.add(filter.getCategory());
        }

        if (filter.getMinPrice() != null) {
            sql.append(" AND EXISTS (SELECT 1 FROM product_variants pv WHERE pv.idProduct = p.id AND pv.price >= ?)");
            params.add(filter.getMinPrice());
        }

        if (filter.getMaxPrice() != null) {
            sql.append(" AND EXISTS (SELECT 1 FROM product_variants pv WHERE pv.idProduct = p.id AND pv.price <= ?)");
            params.add(filter.getMaxPrice());
        }

        // Add sorting
        if (filter.getSortBy() != null && !filter.getSortBy().isEmpty()) {
            String sortColumn = switch (filter.getSortBy().toLowerCase()) {
                case "name" -> "p.productName";
                case "price" -> "(SELECT MIN(price) FROM product_variants WHERE idProduct = p.id)";
                default -> "p.id";
            };

            sql.append(" ORDER BY ").append(sortColumn);
            if (filter.getSortOrder() != null && filter.getSortOrder().equalsIgnoreCase("DESC")) {
                sql.append(" DESC");
            } else {
                sql.append(" ASC");
            }
        }

        try (PreparedStatement stmt = dao.conn.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) {
                stmt.setObject(i + 1, params.get(i));
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                // Lấy thông tin giá từ product_variants
                String priceQuery = "SELECT MIN(price) as minPrice, MAX(price) as maxPrice FROM product_variants WHERE idProduct = ?";
                PreparedStatement priceStmt = dao.conn.prepareStatement(priceQuery);
                priceStmt.setInt(1, rs.getInt("id"));
                ResultSet priceRs = priceStmt.executeQuery();
                double minPrice = 0, maxPrice = 0;
                if (priceRs.next()) {
                    minPrice = priceRs.getDouble("minPrice");
                    maxPrice = priceRs.getDouble("maxPrice");
                }

                // Lấy thông tin hình ảnh
                String imageQuery = "SELECT imageData FROM Images WHERE idProduct = ? ORDER BY id LIMIT 2";
                PreparedStatement imageStmt = dao.conn.prepareStatement(imageQuery);
                imageStmt.setInt(1, rs.getInt("id"));
                ResultSet imageRs = imageStmt.executeQuery();
                String image1 = null, image2 = null;
                if (imageRs.next()) {
                    image1 = imageRs.getString("imageData");
                    if (imageRs.next()) {
                        image2 = imageRs.getString("imageData");
                    }
                }

                listProduct.addProduct(
                        rs.getInt("id"),
                        rs.getString("productName"),
                        image1,
                        image2,
                        minPrice,
                        maxPrice
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listProduct;
    }

    }



