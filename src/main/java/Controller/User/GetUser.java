package Controller.User;

import Models.User.User;
import Services.ServiceUser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(
        value = "/getUser"
)
public class GetUser extends HttpServlet {
    ServiceUser serviceUser = new ServiceUser();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
       int idUser = (int) session.getAttribute("idUser");
        User user = serviceUser.getUserByIdInfor(idUser);
        if(user != null){
            session.setAttribute("userInfor",user);
            resp.sendRedirect("User/guest-info.jsp");
        }
    }
}
