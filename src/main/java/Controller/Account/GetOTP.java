package Controller.Account;

import Models.User.User;
import Services.ServiceUser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.mail.MessagingException;
import java.io.IOException;

@WebServlet(
        value = "/getOTP"
)
public class GetOTP extends HttpServlet {
    ServiceUser serviceUser = new ServiceUser();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        int idUser = (int) session.getAttribute("idUser");
        User user = serviceUser.getUserByIdInfor(idUser);
       String otp = serviceUser.generateOtp();
       session.setAttribute("otp",otp);
        String subject = "Mã OTP để thay đổi mật khẩu";
        String messageContent = "Chào bạn,\n\n" +
                "Để thay đổi mật khẩu của bạn, vui lòng sử dụng mã OTP sau:\n" +
                "Mã OTP: " + otp + "\n\n" +
                "Mã OTP này có hiệu lực trong 10 phút. Vui lòng không chia sẻ mã này với người khác.\n\n" +
                "Cảm ơn bạn!";
        try {
            serviceUser.sendEmail(user.getEmail(),subject,messageContent );
            resp.sendRedirect("User/guest-info.jsp");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }
}
