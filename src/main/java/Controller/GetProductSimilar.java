package Controller;


import Models.Product.ListProduct;
import Models.Products.Products;
import Services.ServiceProductCategory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(
        value = "/getProductSimilar"
)
public class GetProductSimilar extends HttpServlet {
    ServiceProductCategory serviceProductCategory = new ServiceProductCategory();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        int idCategory = (int) session.getAttribute("idCate");
        try {
           ListProduct productSimilar = serviceProductCategory.getProductCategorySimilar(idCategory);
           session.setAttribute("productSimilar",productSimilar);
           resp.sendRedirect("product_detail.jsp");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
