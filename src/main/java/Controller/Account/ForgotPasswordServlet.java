package Controller.Account;

import Dao.ActivityLogDAO;
import Models.Log.ActivityLog;
import Models.User.User;
import Services.ServiceResetToken;
import Services.ServiceUser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.mail.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(value = "/forgotPassword")
public class ForgotPasswordServlet extends HttpServlet {
    ServiceUser serviceUser = new ServiceUser();
    ServiceResetToken serviceResetToken = new ServiceResetToken();
    private ActivityLogDAO logDAO;

    public void init() {
        logDAO = new ActivityLogDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        User user = serviceUser.getUserByEmail(email);

        if (user != null) {
            try {
                String token = serviceResetToken.generateRandomToken();
                boolean isTokenSaved = serviceResetToken.saveResetToken(user.getId(), token);
                
                if (isTokenSaved) {
                    String resetPasswordLink = "http://localhost:8080/WebFinall/Account/resetPassword.jsp?token=" + token;
                    String subject = "Thông Báo Đổi Mật Khẩu Tài Khoản Của Bạn";
                    String messageContent = "Kính gửi " + user.getUserName() + ",\n" +
                            "Để thay đổi mật khẩu tài khoản của bạn, vui lòng nhấn vào liên kết dưới đây:\n" +
                            resetPasswordLink + "\n" +
                            "Nếu bạn không yêu cầu thay đổi mật khẩu này, vui lòng bỏ qua email này.\n" +
                            "Trân trọng,\n" +
                            "[Đội ngũ hỗ trợ]";

                    serviceUser.sendEmail(email, subject, messageContent);

                    // Ghi log thành công - sử dụng getRoleName từ idRole
                    String roleName = getRoleName(user.getIdRole());
                    ActivityLog activityLog = new ActivityLog(
                        email,
                        roleName,
                        "FORGOT_PASSWORD_REQUEST",
                        "Gửi yêu cầu khôi phục mật khẩu thành công",
                        Long.valueOf(user.getId())
                    );
                    logDAO.saveLog(activityLog);

                    resp.sendRedirect("Account/login.jsp");
                } else {
                    // Ghi log lỗi token
                    logError(user, "FORGOT_PASSWORD_TOKEN_ERROR", "Không thể lưu token khôi phục mật khẩu");
                    resp.sendRedirect("Account/forgotPassword.jsp?error=token");
                }
            } catch (Exception e) {
                // Ghi log lỗi
                logError(user, "FORGOT_PASSWORD_ERROR", "Lỗi khi xử lý yêu cầu khôi phục mật khẩu: " + e.getMessage());
                resp.sendRedirect("Account/forgotPassword.jsp?error=system");
            }
        } else {
            // Ghi log email không tồn tại
            ActivityLog errorLog = new ActivityLog(
                email,
                "Unknown",
                "FORGOT_PASSWORD_INVALID_EMAIL",
                "Yêu cầu khôi phục mật khẩu với email không tồn tại",
                null
            );
            try {
                logDAO.saveLog(errorLog);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            resp.sendRedirect("Account/forgotPassword.jsp?error=email");
        }
    }

    private void logError(User user, String actionType, String description) {
        try {
            String roleName = getRoleName(user.getIdRole());
            ActivityLog errorLog = new ActivityLog(
                user.getEmail(),
                roleName,
                actionType,
                description,
                Long.valueOf(user.getId())
            );
            logDAO.saveLog(errorLog);
        } catch (Exception e) {
            System.err.println("Không thể ghi log lỗi: " + e.getMessage());
        }
    }

    // Thêm phương thức để lấy tên role từ idRole
    private String getRoleName(int idRole) {
        switch (idRole) {
            case 1:
                return "Admin";
            case 2:
                return "User";
            default:
                return "Unknown";
        }
    }
}