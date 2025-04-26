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
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

@WebServlet(
        value = "/changePassword"
)
public class ChangePassword  extends HttpServlet {
    ServiceUser serviceUser = new ServiceUser();
    ServiceResetToken serviceResetToken = new ServiceResetToken();
    private ActivityLogDAO logDAO;

    public void init() {
        logDAO = new ActivityLogDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        int idUser = (int) session.getAttribute("idUser");
        String otp = (String) session.getAttribute("otp");
        String password =  req.getParameter("oldPassword");
        String newPassword = req.getParameter("newPassword");
        String confirmPassword = req.getParameter("confirmPassword");
        String otpCheck = req.getParameter("otp");
        try {
            User user = serviceUser.getUserById(idUser);
            String hassPass = serviceUser.hashPassword(password);
            if(serviceUser.checkPasswordExists(idUser,hassPass) && newPassword.equals(confirmPassword) && otpCheck.equals(otp) ){
                String hassNewPassword = serviceUser.hashPassword(newPassword);
                serviceUser.updatePassword(idUser,hassNewPassword);
                
                // Ghi log thành công - sử dụng getRoleName từ idRole
                String roleName = getRoleName(user.getIdRole());
                ActivityLog activityLog = new ActivityLog(
                    user.getEmail(),
                    roleName,
                    "CHANGE_PASSWORD",
                    "Thay đổi mật khẩu thành công",
                    Long.valueOf(idUser)
                );
                logDAO.saveLog(activityLog);

                session.setAttribute("successMessage", "Thay đổi mật khẩu thành công!");
                resp.sendRedirect("User/guest-info.jsp");
                session.removeAttribute("otp");
            } else {
                // Ghi log thất bại
                String roleName = getRoleName(user.getIdRole());
                ActivityLog errorLog = new ActivityLog(
                    user.getEmail(),
                    roleName,
                    "CHANGE_PASSWORD_FAILED",
                    "Thay đổi mật khẩu thất bại - Thông tin không hợp lệ",
                    Long.valueOf(idUser)
                );
                logDAO.saveLog(errorLog);

                session.setAttribute("errorMessage", "Thông tin không hợp lệ!");
                resp.sendRedirect("User/guest-info.jsp");
            }
        } catch (Exception e) {
            // Ghi log lỗi
            logError(session, idUser, "ERROR_CHANGE_PASSWORD", "Lỗi khi thay đổi mật khẩu: " + e.getMessage());
            session.setAttribute("errorMessage", "Đã xảy ra lỗi!");
            resp.sendRedirect("User/guest-info.jsp");
        }
    }

    private void logError(HttpSession session, int userId, String actionType, String description) {
        try {
            User user = serviceUser.getUserById(userId);
            if (user != null) {
                String roleName = getRoleName(user.getIdRole());
                ActivityLog errorLog = new ActivityLog(
                    user.getEmail(),
                    roleName,
                    actionType,
                    description,
                    Long.valueOf(userId)
                );
                logDAO.saveLog(errorLog);
            }
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
