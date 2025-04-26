package Controller.Account;

import Services.RedisOTPService;
import Services.ServiceUser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/verifyAccount")
public class VerifyAccount  extends HttpServlet {
    private RedisOTPService redisOTPService = new RedisOTPService();
    ServiceUser serviceUser = new ServiceUser();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        String email = req.getParameter("email");
        String token = req.getParameter("token");

        if (email == null || token == null) {
            session.setAttribute("status", "error");
            session.setAttribute("message", "Thiếu thông tin email hoặc token xác thực.");
            resp.sendRedirect(req.getContextPath() + "/verify.jsp");
            return;
        }
        try {
            String tokenOrigin = redisOTPService.getToken(email);

            if (tokenOrigin == null) {
                session.setAttribute("status", "error");
                session.setAttribute("message", "Mã xác thực không tồn tại hoặc đã hết hạn.");
            } else if (token.equals(tokenOrigin)) {
                serviceUser.updateUserActive(email,true);
                session.setAttribute("status", "success");
                session.setAttribute("message", "Tài khoản đã được xác thực thành công!");
                redisOTPService.deleteToken(email);
            } else {
                session.setAttribute("status", "error");
                session.setAttribute("message", "Mã xác thực không hợp lệ.");
            }

            resp.sendRedirect(req.getContextPath() + "/verify.jsp");
        } catch (Exception e) {
            session.setAttribute("status", "error");
            session.setAttribute("message", "Đã xảy ra lỗi hệ thống: " + e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/verify.jsp");
        }
    }
}
