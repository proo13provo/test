package Admin;

import Models.ListUser.ListUser;
import Services.ServiceUser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(
        value = "/admin/getAllUser"
)
public class GetAllUser  extends HttpServlet {
    ServiceUser serviceUser = new ServiceUser();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session =  req.getSession(true);
        ListUser items = serviceUser.getUsers();
        session.setAttribute("get_all_user",items);
        resp.sendRedirect("manage-user.jsp");
    }
}
