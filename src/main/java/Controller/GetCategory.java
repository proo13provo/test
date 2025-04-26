package Controller;

import Models.Category.Category;
import Services.ServiceAddCategories;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(
        value = "/getCategory"
)
public class GetCategory extends HttpServlet {
    Category item = new Category();
    ServiceAddCategories categories = new ServiceAddCategories();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            item =  categories.getCategories();
            HttpSession session = req.getSession(true);
            session.setAttribute("categories",item);
            resp.sendRedirect("getSupplier");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
