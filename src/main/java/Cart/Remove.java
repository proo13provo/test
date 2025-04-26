package Cart;

import Models.cart.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet(
        value = "/remove"
)
public class Remove extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        Cart ca = (Cart) session.getAttribute("cr7");
        if(ca == null){
            ca = new Cart();
            session.setAttribute("cr7",ca);
        }
        String id = req.getParameter("productID");
        String weight = req.getParameter("weight");
        ca.removeCart(id,weight);
        System.out.println("Co vao day kog");
        session.setAttribute("cr7",ca);
        resp.sendRedirect("shoppingCart.jsp");

    }
}
