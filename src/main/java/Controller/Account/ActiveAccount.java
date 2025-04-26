package Controller.Account;

import Services.RedisOTPService;
import Services.ServiceEmail;
import Services.TokenService;
import com.google.gson.JsonObject;
import com.google.protobuf.ServiceException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.mail.MessagingException;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/activeAccount")
public class ActiveAccount extends HttpServlet {
    private RedisOTPService redisOTPService = new RedisOTPService();
    private ServiceEmail emailService = new ServiceEmail();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        String email = req.getParameter("email");
        PrintWriter out = resp.getWriter();
        JsonObject jsonResponse = new JsonObject();


        try {
            if (email == null || email.isEmpty()) {
                jsonResponse.addProperty("success", false);
                jsonResponse.addProperty("message", "Email không được để trống");
                out.print(jsonResponse.toString());
                return;
            }

            String tokenActive = TokenService.generateSecureToken();
            redisOTPService.saveToken(email, tokenActive, 900);
            String activeAccount = "http://localhost:8080/WebFinall/verifyAccount?token=" + tokenActive + "&email=" + email;

            String subject = "Thông Báo Xác Thực Tài Khoản";
            String messageContent = "<div style='font-family: \"Segoe UI\", Roboto, \"Helvetica Neue\", Arial, sans-serif; max-width: 600px; margin: 0 auto; border-radius: 8px; overflow: hidden; box-shadow: 0 4px 12px rgba(0,0,0,0.1);'>"
                    + "<div style='background: linear-gradient(135deg, #4361ee 0%, #3a0ca3 100%); padding: 30px; text-align: center;'>"
                    + "<h1 style='color: white; margin: 0; font-size: 28px; font-weight: 600;'>XÁC THỰC TÀI KHOẢN</h1>"
                    + "</div>"
                    + "<div style='padding: 40px 30px; background: #ffffff;'>"
                    + "<p style='font-size: 16px; color: #333333; margin-bottom: 20px;'>Xin chào <strong>" + email + "</strong>,</p>"
                    + "<p style='font-size: 16px; color: #555555; line-height: 1.6;'>Cảm ơn bạn đã đăng ký tài khoản. Vui lòng nhấn vào nút bên dưới để hoàn tất quá trình xác thực:</p>"
                    + "<div style='text-align: center; margin: 40px 0;'>"
                    + "<a href='" + activeAccount + "' style='display: inline-block; background: linear-gradient(135deg, #4361ee 0%, #3a0ca3 100%); color: white; padding: 14px 28px; text-decoration: none; border-radius: 6px; font-weight: 600; font-size: 16px; box-shadow: 0 4px 8px rgba(67, 97, 238, 0.3); transition: all 0.3s ease;'>XÁC THỰC NGAY</a>"
                    + "</div>"
                    + "<p style='font-size: 14px; color: #888888; text-align: center; line-height: 1.5;'>Liên kết này sẽ hết hạn sau <strong style='color: #4361ee;'>15 phút</strong>.<br>Nếu bạn không yêu cầu email này, vui lòng bỏ qua nó.</p>"
                    + "</div>"
                    + "<div style='background: #f8f9fa; padding: 20px; text-align: center; border-top: 1px solid #e9ecef;'>"
                    + "<p style='font-size: 14px; color: #6c757d; margin: 0;'>Trân trọng,<br><strong style='color: #4361ee;'>Đội ngũ hỗ trợ</strong></p>"
                    + "<p style='font-size: 12px; color: #adb5bd; margin-top: 15px;'>© 2023 Your Company. All rights reserved.</p>"
                    + "</div>"
                    + "</div>";

            boolean emailSent = emailService.sendEmail(email, subject, messageContent);

            if (emailSent) {
                jsonResponse.addProperty("success", true);
                jsonResponse.addProperty("message", "Email xác thực đã được gửi thành công!");
            } else {
                jsonResponse.addProperty("success", false);
                jsonResponse.addProperty("message", "Gửi email thất bại, vui lòng thử lại");
            }
        } catch (Exception e) {
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "Lỗi hệ thống: " + e.getMessage());
        }

        out.print(jsonResponse.toString());
        out.flush();
    }
}