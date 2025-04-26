package Admin;

import Models.ManageProduct.ListProductManage;
import Services.ServiceProduct;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(
        value = "/admin/getAllProduct"
)
public class DisplayProductManage  extends HttpServlet {
    ServiceProduct serviceProduct = new ServiceProduct();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession(true);
        try {
            ListProductManage productManage = serviceProduct.getAllProducts();
            session.setAttribute("productManages",productManage);
            resp.sendRedirect("../getCategory");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
