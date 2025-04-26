package Controller;

import Models.cart.CartProduct;
import Models.cart.Productt;
import Models.cart.Cart;
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
        value = "/product_deIcon"
)
public class product_detalIcon extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ServiceProduct serviceProduct = new ServiceProduct();
        String id = req.getParameter("productID");
        String weight = req.getParameter("weight");
        String url = req.getParameter("url");
        System.out.println(id);
        System.out.println(weight);
        System.out.println(url);

        CartProduct pro = null;
        HttpSession session = req.getSession(true);
        try {
            pro = serviceProduct.getById(String.valueOf(id), Integer.parseInt(weight));
            Cart cart = (Cart) session.getAttribute("cr7");
            if (cart == null) {
                cart = new Cart();
            }

            cart.addCart(pro);


            session.setAttribute("cr7", cart);
            resp.sendRedirect("products?success=true");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

