package Admin;

import Dao.ActivityLogDAO;
import Models.Log.ActivityLog;
import Models.User.User;
import Services.ServiceProduct;
import Sercurity.JwtUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(value = "/admin/editProduct")
public class EditProduct extends HttpServlet {
    ServiceProduct serviceProduct = new ServiceProduct();
    private ActivityLogDAO logDAO;

    public void init() {
        logDAO = new ActivityLogDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        // Kiểm tra session và token
        if (session == null || session.getAttribute("authToken") == null) {
            resp.sendRedirect(req.getContextPath() + "/Account/login.jsp");
            return;
        }

        String token = (String) session.getAttribute("authToken");

        // Kiểm tra token có hợp lệ không
        if (!JwtUtil.isTokenValid(token)) {
            session.invalidate();
            resp.sendRedirect(req.getContextPath() + "/Account/login.jsp");
            return;
        }

        // Kiểm tra role
        String role = JwtUtil.extractRole(token);
        if (role == null || !role.equals("ROLE_Admin")) {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Không có quyền truy cập");
            return;
        }

        try {
            // Lấy thông tin user từ session
            User user = (User) session.getAttribute("userInfor");
            String username = user != null ? user.getEmail() : "unknown";

            // Lấy và validate các tham số
            int productId = validateAndParseInt(req.getParameter("productId"), "ID sản phẩm");
            String productName = validateString(req.getParameter("productName"), "Tên sản phẩm");
            double productPrice = validateAndParseDouble(req.getParameter("productPrice"), "Giá sản phẩm");
            int productQuantity = validateAndParseInt(req.getParameter("productQuantity"), "Số lượng");
            double productWeight = validateAndParseDouble(req.getParameter("productWeight"), "Khối lượng");
            String productDescription = validateString(req.getParameter("productDescription"), "Mô tả");
            int idSupplier = validateAndParseInt(req.getParameter("productSupplier"), "Nhà cung cấp");
            int idCategory = validateAndParseInt(req.getParameter("productCategory"), "Danh mục");
            int productStatus = validateAndParseInt(req.getParameter("productStatus"), "Trạng thái");

            // Cập nhật sản phẩm
            serviceProduct.updateProductAndVariant(
                    productId,
                    productWeight,
                    productPrice,
                    productQuantity,
                    productDescription,
                    idCategory,
                    idSupplier,
                    productStatus
            );

            // Ghi log hoạt động
            String logDescription = String.format(
                    "Cập nhật sản phẩm ID: %d - Tên: %s - Giá: %.2f - Số lượng: %d - Danh mục: %d - Nhà cung cấp: %d",
                    productId, productName, productPrice, productQuantity, idCategory, idSupplier
            );

            ActivityLog activityLog = new ActivityLog(
                    username,
                    "Admin",
                    "UPDATE_PRODUCT",
                    logDescription,
                    Long.valueOf(productId)
            );
            logDAO.saveLog(activityLog);

            // Thêm thông báo thành công vào session
            session.setAttribute("successMessage", "Cập nhật sản phẩm thành công!");
            resp.sendRedirect(req.getContextPath() + "/admin/getAllProduct");

        } catch (ValidationException e) {
            // Log lỗi validate
            logError(session, "VALIDATION_ERROR", "Lỗi validate khi sửa sản phẩm: " + e.getMessage());
            // Thêm thông báo lỗi vào session
            session.setAttribute("errorMessage", "Lỗi: " + e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/admin/getAllProduct");
        } catch (SQLException e) {
            // Log lỗi SQL
            logError(session, "SQL_ERROR", "Lỗi SQL khi sửa sản phẩm: " + e.getMessage());
            session.setAttribute("errorMessage", "Lỗi khi cập nhật sản phẩm trong cơ sở dữ liệu");
            resp.sendRedirect(req.getContextPath() + "/admin/getAllProduct");
        } catch (Exception e) {
            // Log lỗi không xác định
            logError(session, "UNKNOWN_ERROR", "Lỗi không xác định khi sửa sản phẩm: " + e.getMessage());
            session.setAttribute("errorMessage", "Đã xảy ra lỗi không xác định");
            resp.sendRedirect(req.getContextPath() + "/admin/getAllProduct");
        }
    }

    // Phương thức ghi log lỗi
    private void logError(HttpSession session, String actionType, String description) {
        try {
            User user = (User) session.getAttribute("userInfor");
            String username = user != null ? user.getEmail() : "unknown";

            ActivityLog errorLog = new ActivityLog(
                    username,
                    "Admin",
                    actionType,
                    description,
                    null
            );
            logDAO.saveLog(errorLog);
        } catch (Exception e) {
            // Nếu không thể ghi log, in ra console
            System.err.println("Không thể ghi log lỗi: " + e.getMessage());
        }
    }

    // Các phương thức validate
    private static class ValidationException extends Exception {
        public ValidationException(String message) {
            super(message);
        }
    }

    private int validateAndParseInt(String value, String fieldName) throws ValidationException {
        if (value == null || value.trim().isEmpty()) {
            throw new ValidationException(fieldName + " không được để trống");
        }
        try {
            return Integer.parseInt(value.trim());
        } catch (NumberFormatException e) {
            throw new ValidationException(fieldName + " phải là số nguyên hợp lệ");
        }
    }

    private double validateAndParseDouble(String value, String fieldName) throws ValidationException {
        if (value == null || value.trim().isEmpty()) {
            throw new ValidationException(fieldName + " không được để trống");
        }
        try {
            return Double.parseDouble(value.trim());
        } catch (NumberFormatException e) {
            throw new ValidationException(fieldName + " phải là số thực hợp lệ");
        }
    }

    private String validateString(String value, String fieldName) throws ValidationException {
        if (value == null || value.trim().isEmpty()) {
            throw new ValidationException(fieldName + " không được để trống");
        }
        return value.trim();
    }
}