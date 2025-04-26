package Controller.Account;

import Models.User.User;
import Services.ServiceUser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

@WebServlet(
        value = "/checkRegisterNha"
)
public class Register extends HttpServlet {
    ServiceUser serviceUser = new ServiceUser();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String phoneNumber = req.getParameter("phoneNumber");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        String agreeTerms = req.getParameter("agreeTerms");

        // Kiểm tra thông tin đầu vào
        if (fullName == null || fullName.isEmpty() ||
                email == null || email.isEmpty() ||
                phoneNumber == null || phoneNumber.isEmpty() ||
                password == null || password.isEmpty() ||
                confirmPassword == null || confirmPassword.isEmpty()) {
            req.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin.");
            req.getRequestDispatcher("Account/register.jsp").forward(req, resp);
            return;
        }

        if (!password.equals(confirmPassword)) {
            req.setAttribute("errorMessage", "Mật khẩu và nhập lại mật khẩu không khớp.");
            req.getRequestDispatcher("Account/register.jsp").forward(req, resp);
            return;
        }

        if (agreeTerms == null) {
            req.setAttribute("errorMessage", "Bạn cần đồng ý với điều khoản sử dụng.");
            req.getRequestDispatcher("Account/register.jsp").forward(req, resp);
            return;
        }

        // Kiểm tra email đã tồn tại
        if (serviceUser.getUserByEmail(email) != null) {
            req.setAttribute("errorMessage", "Email đã tồn tại. Vui lòng sử dụng email khác.");
            req.getRequestDispatcher("Account/register.jsp").forward(req, resp);
            return;
        }

        // Đăng ký người dùng
        try {
            String hashPassword = serviceUser.hashPassword(password);
            User user = new User(email, hashPassword, fullName, phoneNumber);
            boolean registerSuccess = serviceUser.registerUser(user);

            if (registerSuccess) {
                resp.sendRedirect("Account/login.jsp");
            } else {
                req.setAttribute("errorMessage", "Đã xảy ra lỗi khi đăng ký. Vui lòng thử lại.");
                req.getRequestDispatcher("Account/register.jsp").forward(req, resp);
            }
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}