package Controller.Account;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.URLEncoder;

@WebServlet("/facebook-login")
public class FacebookLoginServlet extends HttpServlet {
    private static final String CLIENT_ID = "1667332817215986";
    private static final String REDIRECT_URI = "http://localhost:8080/WebFinall/facebook-callback";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String facebookAuthUrl = "https://www.facebook.com/v12.0/dialog/oauth?"
                + "client_id=" + CLIENT_ID
                + "&redirect_uri=" + URLEncoder.encode(REDIRECT_URI, "UTF-8")
                + "&scope=email,public_profile";

        response.sendRedirect(facebookAuthUrl);
    }
}