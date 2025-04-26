package Controller.Account;


import Dao.UserDao;
import Models.User.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;





@WebServlet("/sign-up")
public class SignUpServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao userDao = new UserDao();
        String fullName = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm-password");

        if (password.equals(confirmPassword)) {
            try {
                // Mã hóa mật khẩu bằng SHA-256
                String hashedPassword = userDao.hashPassword(password);

                // Gọi DAO để lưu thông tin người dùng vào database
                User user = new User();
                user.setUserName(fullName);
                user.setEmail(email);
                user.setUserPassword(hashedPassword); // Lưu mật khẩu đã mã hóa


                boolean isRegistered = userDao.registerUser(user);

                if (isRegistered) {
                    response.sendRedirect("login.jsp");
                } else {
                    request.setAttribute("errorMessage", "Đăng ký thất bại. Vui lòng thử lại!");
                    request.getRequestDispatcher("sign-up.jsp").forward(request, response);
                }
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Đã xảy ra lỗi khi xử lý mật khẩu.");
                request.getRequestDispatcher("sign-up.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Mật khẩu xác nhận không khớp!");
            request.getRequestDispatcher("sign-up.jsp").forward(request, response);
        }
    }
}