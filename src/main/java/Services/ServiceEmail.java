package Services;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ServiceEmail {
    private static final Logger logger = Logger.getLogger(ServiceEmail.class.getName());

    // Thông tin cấu hình email
    private static final String SENDER_EMAIL = "hoangvu03102004@gmail.com";
    private static final String SENDER_PASSWORD = "zybg xrit btjb ozow";
    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final int SMTP_PORT = 587;

    // Singleton pattern
    private static ServiceEmail instance;

    public ServiceEmail() {
        // Private constructor for singleton
    }

    public static synchronized ServiceEmail getInstance() {
        if (instance == null) {
            instance = new ServiceEmail();
        }
        return instance;
    }

    public String generateOtp() {
        return String.format("%06d", new Random().nextInt(999999));
    }

    public boolean sendEmail(String recipientEmail, String subject, String messageContent) {
        // Validate input
        if (recipientEmail == null || recipientEmail.trim().isEmpty()) {
            logger.log(Level.WARNING, "Recipient email is empty");
            return false;
        }

        Properties properties = new Properties();
        properties.put("mail.smtp.host", SMTP_HOST);
        properties.put("mail.smtp.port", SMTP_PORT);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
        properties.put("mail.smtp.ssl.trust", SMTP_HOST);

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER_EMAIL, SENDER_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SENDER_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject(subject);

            // Sử dụng HTML content thay vì plain text
            message.setContent(messageContent, "text/html; charset=utf-8");

            Transport.send(message);
            logger.log(Level.INFO, "Email sent successfully to: " + recipientEmail);
            return true;
        } catch (MessagingException e) {
            logger.log(Level.SEVERE, "Failed to send email to: " + recipientEmail, e);
            return false;
        }
    }

    // Phương thức gửi email với template HTML
    public boolean sendVerificationEmail(String recipientEmail, String verificationLink) {
        String subject = "Xác thực tài khoản của bạn";

        String htmlContent = "<!DOCTYPE html>"
                + "<html>"
                + "<head>"
                + "<style>"
                + "body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; max-width: 600px; margin: 0 auto; padding: 20px; }"
                + ".header { color: #4361ee; text-align: center; }"
                + ".button { display: inline-block; background-color: #4361ee; color: white; "
                + "padding: 12px 24px; text-decoration: none; border-radius: 4px; font-weight: bold; margin: 20px 0; }"
                + ".footer { margin-top: 30px; font-size: 12px; color: #777; }"
                + "</style>"
                + "</head>"
                + "<body>"
                + "<h1 class=\"header\">Xác thực tài khoản</h1>"
                + "<p>Xin chào,</p>"
                + "<p>Cảm ơn bạn đã đăng ký tài khoản. Vui lòng nhấn vào nút bên dưới để xác thực email của bạn:</p>"
                + "<div style=\"text-align: center;\">"
                + "<a href=\"" + verificationLink + "\" class=\"button\">Xác thực tài khoản</a>"
                + "</div>"
                + "<p>Nếu bạn không yêu cầu xác thực này, vui lòng bỏ qua email này.</p>"
                + "<p>Liên kết sẽ hết hạn sau 15 phút.</p>"
                + "<div class=\"footer\">"
                + "<p>Trân trọng,</p>"
                + "<p>Đội ngũ hỗ trợ</p>"
                + "</div>"
                + "</body>"
                + "</html>";

        return sendEmail(recipientEmail, subject, htmlContent);
    }
}