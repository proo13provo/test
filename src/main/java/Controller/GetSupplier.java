package Controller;

import Models.Supplier.Supplier;
import Services.ServiceAddSupplier;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(
        value = "/getSupplier"
)
public class GetSupplier extends HttpServlet {
    Supplier items = new Supplier();
    ServiceAddSupplier supplier = new ServiceAddSupplier();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            items = supplier.getSupplier();
            HttpSession session = req.getSession(true);
            session.setAttribute("suppliers",items);
            resp.sendRedirect("admin/manage-product.jsp");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
