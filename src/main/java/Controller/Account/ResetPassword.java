package Controller.Account;

import Models.User.User;
import Services.ServiceResetToken;
import Services.ServiceUser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

@WebServlet("/resetPassword")
public class ResetPassword extends HttpServlet {
    ServiceUser serviceUser = new ServiceUser();
    ServiceResetToken serviceResetToken = new ServiceResetToken();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String token = req.getParameter("token");
        String newPassword = req.getParameter("newPassword");
        String confirmPassword = req.getParameter("confirmPassword");

        if (newPassword.equals(confirmPassword)) {
            User user = serviceResetToken.getUserByToken(token);
            if (user != null) {
                // Hash mật khẩu mới
                String hashedPassword = null;
                try {
                    hashedPassword = serviceUser.hashPassword(newPassword);
                } catch (NoSuchAlgorithmException e) {
                    throw new RuntimeException(e);
                }

                // Cập nhật mật khẩu mới
                boolean isUpdated = serviceUser.updatePassword(user.getId(), hashedPassword);
                if (isUpdated) {
                    resp.sendRedirect("Account/login.jsp");
                } else {
                    resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Không thể cập nhật mật khẩu.");
                }
            } else {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Token không hợp lệ.");
            }
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Mật khẩu không khớp.");
        }
    }
}