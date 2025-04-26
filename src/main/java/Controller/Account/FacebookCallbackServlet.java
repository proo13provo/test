package Controller.Account;

import Dao.UserDao;
import Models.User.User;
import Sercurity.JwtUtil;
import Services.RenderURLFacebook;
import Services.ServiceRole;
import Services.ServiceUser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

@WebServlet("/facebook-callback")
public class FacebookCallbackServlet extends HttpServlet {
    private static final String CLIENT_ID = "1667332817215986";
    private static final String CLIENT_SECRET = "2b3db4948b265ab229e18afc6554a060";
    private static final String REDIRECT_URI = "http://localhost:8080/WebFinall/facebook-callback";
    private RenderURLFacebook renderURLFacebook = new RenderURLFacebook();
    ServiceUser serviceUser = new ServiceUser();
    ServiceRole serviceRole = new ServiceRole();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");

        if (code == null) {
            response.getWriter().println("Login failed!");
            return;
        }

        String tokenUrl = "https://graph.facebook.com/v12.0/oauth/access_token?"
                + "client_id=" + CLIENT_ID
                + "&redirect_uri=" + URLEncoder.encode(REDIRECT_URI, "UTF-8")
                + "&client_secret=" + CLIENT_SECRET
                + "&code=" + code;

        String tokenResponse = sendHttpGetRequest(tokenUrl);
        JSONObject jsonObject = new JSONObject(tokenResponse);
        String accessToken = jsonObject.getString("access_token");

        String userInfoUrl = "https://graph.facebook.com/me?fields=id,name,email&access_token=" + accessToken;
        String userInfoResponse = sendHttpGetRequest(userInfoUrl);
        JSONObject userJson = new JSONObject(userInfoResponse);
        System.out.println(userJson);

        // Lấy thông tin user
        String userId = userJson.getString("id");
        String userName = userJson.getString("name");
        String userEmail = userJson.has("email") ? userJson.getString("email") : "Không có email";
        String profilePicUrl = "https://graph.facebook.com/"+ userId + "/picture?type=large&redirect=0&access_token=" + accessToken ;
      String urlImage = renderURLFacebook.returnURL(profilePicUrl);
        System.out.println(urlImage);

        System.out.println(userId);
        System.out.println(userName);
        System.out.println(userEmail);
        UserDao userDAO = new UserDao();
        User user = userDAO.getUserByEmail(userEmail);


        if (user == null) {
            user = new User(userEmail, userName, urlImage, 2);
            userDAO.addUserFb(user);
        }
        user = userDAO.getUserByEmail(userEmail);
        HttpSession session = request.getSession();
        session.setAttribute("userInfor", user);
        session.setAttribute("idUser", user.getId());
        session.setAttribute("idRole", user.getIdRole());
        session.setAttribute("nameRole", serviceRole.getRoleNameById(user.getIdRole()));
        System.out.println(user.getIdRole());

        String jwtToken = JwtUtil.generateToken(userEmail,serviceRole.getRoleNameById(user.getIdRole()));
        session.setAttribute("authToken", jwtToken);
        System.out.println(jwtToken);

        response.sendRedirect("index.jsp");
    }

    private String sendHttpGetRequest(String urlStr) throws IOException {
        URL url = new URL(urlStr);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String inputLine;
        StringBuilder content = new StringBuilder();

        while ((inputLine = in.readLine()) != null) {
            content.append(inputLine);
        }

        in.close();
        return content.toString();
    }
}
