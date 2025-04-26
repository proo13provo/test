package Controller;

import Models.WishlistProduct.WishlistProduct;
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
        value = "/getWish"
)
public class GetWishlist extends HttpServlet {
    ServiceWishlist serviceWishlist = new ServiceWishlist();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession(true);
        Integer idUser = (Integer) session.getAttribute("idUser");

        if (idUser == null) {

            resp.sendRedirect("admin/login.jsp");
            return;
        }


        WishlistProduct wishlistProduct ;
        try {
            wishlistProduct = serviceWishlist.selectWishlist(idUser);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        if (wishlistProduct != null) {
                session.setAttribute("wishlist", wishlistProduct);
            }else{
            wishlistProduct = new WishlistProduct();
            session.setAttribute("wishlist", wishlistProduct);
            }


resp.sendRedirect("history.jsp");
    }
}
