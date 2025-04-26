package Controller;

import Models.TopProductBuy.TopProduct;
import Services.ServiceTopProductBuy;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(
        value = "/getTopBuy"
)
public class GetTopBuyProduct  extends HttpServlet {
ServiceTopProductBuy serviceTopProductBuy = new ServiceTopProductBuy();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            TopProduct product = serviceTopProductBuy.getTop5BestSellingProducts();
            if(product != null){
                HttpSession session = req.getSession(true);
                session.setAttribute("topproduct",product);
              resp.sendRedirect("products.jsp");

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
