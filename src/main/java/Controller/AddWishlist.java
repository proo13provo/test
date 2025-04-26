package Controller;

import Services.ServiceWishlist;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(
        value = "/addWishlist"
)
public class AddWishlist extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServiceWishlist serviceWishlist = new ServiceWishlist();
        HttpSession session = req.getSession(true);
        int idUser = (int) session.getAttribute("idUser");



            int idProduct = Integer.parseInt(req.getParameter("productID"));
            try {
                serviceWishlist.addWishlist(idUser,idProduct);
                resp.sendRedirect("products.jsp");
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doPost(req,resp);

    }
}
