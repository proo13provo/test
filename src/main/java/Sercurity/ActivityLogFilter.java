package Sercurity;

import Dao.ActivityLogDAO;
import Models.Log.ActivityLog;
import Models.User.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebFilter("/*")
public class ActivityLogFilter implements Filter {
    private ActivityLogDAO logDAO;

    public void init(FilterConfig filterConfig) throws ServletException {
        logDAO = new ActivityLogDAO();
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String path = httpRequest.getServletPath();

        try {
            // Thực hiện filter chain trước khi log
            chain.doFilter(request, response);

            // Sau khi thực hiện request, kiểm tra và log hoạt động
            HttpSession session = httpRequest.getSession(false);
            if (isValidSession(session)) {
                User user = (User) session.getAttribute("userInfor");
                String nameRole = (String) session.getAttribute("nameRole");

                if (user != null && nameRole != null) {
                    logUserActivity(user.getEmail(), nameRole, path);
                }
            }
        } catch (IllegalStateException e) {
            // Session đã bị vô hiệu hóa - bỏ qua logging
            chain.doFilter(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            chain.doFilter(request, response);
        }
    }

    private boolean isValidSession(HttpSession session) {
        if (session == null) {
            return false;
        }

        try {
            // Kiểm tra session có còn hợp lệ không
            session.getAttribute("userInfor");
            return true;
        } catch (IllegalStateException e) {
            // Session đã bị vô hiệu hóa
            return false;
        }
    }

    private void logUserActivity(String username, String role, String path) {
        try {
            // Log các hoạt động dựa trên path
            if (path.startsWith("/checkLogin")) {
                logAction(username, role, "LOGIN", "Đăng nhập vào hệ thống", null);
            } else if (path.startsWith("/admin/product/add")) {
                logAction(username, role, "ADD_PRODUCT", "Thêm sản phẩm mới", null);
            } else if (path.startsWith("/admin/product/delete")) {
                logAction(username, role, "DELETE_PRODUCT", "Xóa sản phẩm", null);
            } else if (path.startsWith("/admin/product/update")) {
                logAction(username, role, "UPDATE_PRODUCT", "Cập nhật sản phẩm", null);
            } else if (path.startsWith("/cart/add")) {
                logAction(username, role, "ADD_TO_CART", "Thêm sản phẩm vào giỏ hàng", null);
            } else if (path.startsWith("/order/create")) {
                logAction(username, role, "CREATE_ORDER", "Tạo đơn hàng mới", null);
            } else if (path.startsWith("/admin/order/update-status")) {
                logAction(username, role, "UPDATE_ORDER", "Cập nhật trạng thái đơn hàng", null);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void logAction(String username, String role, String actionType, String description, Long entityId)
            throws SQLException {
        ActivityLog log = new ActivityLog(username, role, actionType, description, entityId);
        logDAO.saveLog(log);
    }

    public void destroy() {
    }
}