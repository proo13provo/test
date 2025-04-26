package Controller.Account;

import Dao.ActivityLogDAO;
import Models.User.User;
import Sercurity.JwtUtil;
import Services.ServiceRole;
import Services.ServiceUser;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

@WebServlet("/checkLogin")
public class SignIn extends HttpServlet {
    ServiceUser serviceUser = new ServiceUser();
    ServiceRole serviceRole = new ServiceRole();
    private ActivityLogDAO logDAO;

    public void init() {
        logDAO = new ActivityLogDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.removeAttribute("errorType");
        session.removeAttribute("errorMessage");
        session.removeAttribute("redirectPage");
        session.removeAttribute("redirectDelay");
        Integer idUser = (Integer) session.getAttribute("idUser");

        // Nếu đã đăng nhập thì chuyển hướng
        if (idUser != null) {
            resp.sendRedirect("setupData");
            return;
        }

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // Đếm số lần đăng nhập sai
        Integer failedAttempts = (Integer) session.getAttribute("failedAttempts");
        failedAttempts = (failedAttempts == null) ? 0 : failedAttempts;

        // Kiểm tra reCAPTCHA nếu sai từ 3 lần trở lên
        if (failedAttempts >= 3) {
            String gRecaptchaResponse = req.getParameter("g-recaptcha-response");
            if (gRecaptchaResponse == null || gRecaptchaResponse.isEmpty() || !verifyCaptcha(gRecaptchaResponse)) {
                session.setAttribute("errorType", "captcha");
                session.setAttribute("errorMessage", "Vui lòng xác minh CAPTCHA!");
                session.setAttribute("failedAttempts", failedAttempts);
                resp.sendRedirect(req.getContextPath() + "/Account/login.jsp");
                return;
            }
        }

        try {
            String hashedPassword = serviceUser.hashPassword(password);
            if (serviceUser.checkCredentials(email, hashedPassword)) {
                // Kiểm tra trạng thái tài khoản
                if (!serviceUser.isUserActiveByEmail(email)) {
                    // Tài khoản chưa xác thực
                    session.setAttribute("errorType", "unverified");
                    session.setAttribute("errorMessage", "Tài khoản chưa được xác thực! Vui lòng kiểm tra email để kích hoạt tài khoản.");
                    session.setAttribute("redirectPage", req.getContextPath() + "/Account/activeAccount.jsp?email=" + URLEncoder.encode(email, "UTF-8"));
                    session.setAttribute("redirectDelay", 5);
                    session.setAttribute("unverifiedEmail", email);
                    resp.sendRedirect(req.getContextPath() + "/Account/login.jsp");
                    return;
                }

                // Tài khoản đã xác thực - tiến hành đăng nhập
                session.removeAttribute("failedAttempts");
                session.removeAttribute("unverifiedEmail");
                session.removeAttribute("errorType");
                session.removeAttribute("errorMessage");

                int id = serviceUser.check(email, hashedPassword);
                int idRole = serviceUser.checkRole(email, hashedPassword);
                String nameRole = serviceRole.getRoleNameById(idRole);

                session.setAttribute("idUser", id);
                session.setAttribute("idRole", idRole);
                session.setAttribute("nameRole", nameRole);

                User user = serviceUser.getUserByEmail(email);
                if (user != null) {
                    session.setAttribute("userInfor", user);
                    String token = JwtUtil.generateToken(email, nameRole);
                    System.out.println(token);
                    session.setAttribute("authToken", token);
                    resp.setHeader("Authorization", "Bearer " + token);
                }

                resp.sendRedirect("setupData");
            } else {
                // Sai thông tin đăng nhập
                failedAttempts++;
                session.setAttribute("errorType", "login");
                session.setAttribute("errorMessage", "Sai tài khoản hoặc mật khẩu!");
                session.setAttribute("failedAttempts", failedAttempts);
                resp.sendRedirect(req.getContextPath() + "/Account/login.jsp");
            }
        } catch (NoSuchAlgorithmException e) {
            session.setAttribute("errorType", "system");
            session.setAttribute("errorMessage", "Lỗi hệ thống khi xử lý mật khẩu");
            resp.sendRedirect(req.getContextPath() + "/Account/login.jsp");
        } catch (SQLException e) {
            session.setAttribute("errorType", "system");
            session.setAttribute("errorMessage", "Lỗi hệ thống khi truy vấn dữ liệu");
            resp.sendRedirect(req.getContextPath() + "/Account/login.jsp");
        } catch (Exception e) {
            session.setAttribute("errorType", "system");
            session.setAttribute("errorMessage", "Lỗi hệ thống không xác định");
            resp.sendRedirect(req.getContextPath() + "/Account/login.jsp");
        }
    }

    // Kiểm tra reCAPTCHA với Google
    public boolean verifyCaptcha(String gRecaptchaResponse) {
        String url = "https://www.google.com/recaptcha/api/siteverify";
        String secretKey = "6Lf30PwqAAAAACfRxfocU0gf-EAtO13Av4NyP0l9"; // Thay bằng key thực tế

        try {
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("POST");
            con.setDoOutput(true);

            String postParams = "secret=" + secretKey + "&response=" + gRecaptchaResponse;
            try (OutputStream os = con.getOutputStream()) {
                byte[] input = postParams.getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            // Đọc phản hồi từ Google
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
            StringBuilder response = new StringBuilder();
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            // Parse JSON
            JsonObject jsonResponse = JsonParser.parseString(response.toString()).getAsJsonObject();
            return jsonResponse.get("success").getAsBoolean();

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {

    }
}