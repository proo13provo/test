package Admin;

import Dao.ActivityLogDAO;
import Models.Log.ActivityLog;
import Models.User.User;
import Services.ServiceUser;
import Sercurity.JwtUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(value = "/admin/delete_user")
public class DeleUserManage extends HttpServlet {
    ServiceUser serviceUser = new ServiceUser();
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
            // Lấy thông tin admin thực hiện xóa
            User admin = (User) session.getAttribute("userInfor");
            String adminUsername = admin != null ? admin.getEmail() : "unknown";

            // Lấy ID người dùng cần xóa
            int idUser = Integer.parseInt(req.getParameter("idUser"));

            // Lấy thông tin user trước khi xóa để ghi log
            User userToDelete = serviceUser.getUserById(idUser);
            String userEmail = userToDelete != null ? userToDelete.getEmail() : "unknown";

            // Thực hiện xóa user
            if (serviceUser.deleteUser(idUser)) {
                // Ghi log khi xóa thành công
                String logDescription = String.format(
                        "Xóa người dùng - ID: %d, Email: %s",
                        idUser,
                        userEmail
                );

                ActivityLog activityLog = new ActivityLog(
                        adminUsername,
                        "Admin",
                        "DELETE_USER",
                        logDescription,
                        Long.valueOf(idUser)
                );
                logDAO.saveLog(activityLog);

                // Thêm thông báo thành công
                session.setAttribute("successMessage", "Đã xóa người dùng thành công!");
                resp.sendRedirect(req.getContextPath() + "/admin/getAllUser");
            } else {
                // Ghi log khi xóa thất bại
                String errorDescription = String.format(
                        "Không thể xóa người dùng - ID: %d, Email: %s",
                        idUser,
                        userEmail
                );

                ActivityLog errorLog = new ActivityLog(
                        adminUsername,
                        "Admin",
                        "DELETE_USER_FAILED",
                        errorDescription,
                        Long.valueOf(idUser)
                );
                logDAO.saveLog(errorLog);

                // Thêm thông báo lỗi
                session.setAttribute("errorMessage", "Không thể xóa người dùng!");
                resp.sendRedirect(req.getContextPath() + "/admin/getAllUser");
            }
        } catch (NumberFormatException e) {
            // Log lỗi định dạng ID
            logError(session, "VALIDATION_ERROR", "ID người dùng không hợp lệ: " + e.getMessage());
            session.setAttribute("errorMessage", "ID người dùng không hợp lệ!");
            resp.sendRedirect(req.getContextPath() + "/admin/getAllUser");
        } catch (Exception e) {
            // Log lỗi không xác định
            logError(session, "UNKNOWN_ERROR", "Lỗi khi xóa người dùng: " + e.getMessage());
            session.setAttribute("errorMessage", "Đã xảy ra lỗi khi xóa người dùng!");
            resp.sendRedirect(req.getContextPath() + "/admin/getAllUser");
        }
    }

    // Phương thức ghi log lỗi
    private void logError(HttpSession session, String actionType, String description) {
        try {
            User admin = (User) session.getAttribute("userInfor");
            String adminUsername = admin != null ? admin.getEmail() : "unknown";

            ActivityLog errorLog = new ActivityLog(
                    adminUsername,
                    "Admin",
                    actionType,
                    description,
                    null
            );
            logDAO.saveLog(errorLog);
        } catch (Exception e) {
            System.err.println("Không thể ghi log lỗi: " + e.getMessage());
        }
    }
}