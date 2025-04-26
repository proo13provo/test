package Admin;

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
value = "/admin/addSupplier"
        )
public class AddSuppllier extends HttpServlet {
    ServiceAddSupplier addSupplier = new ServiceAddSupplier();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String supplierName = req.getParameter("supplierName");
        String contactInfo = req.getParameter("contactInfo");
        String address = req.getParameter("address");
        int isActive = Integer.parseInt(req.getParameter("isActive"));

        try {
            boolean success = addSupplier.addSupplier(supplierName, contactInfo, address, isActive);
            if (success) {
                req.setAttribute("message", "Supplier added successfully!");  // Thiết lập thông báo thành công
            } else {
                req.setAttribute("message", "Failed to add supplier.");
            }
            req.getRequestDispatcher("addSupplier.jsp").forward(req, resp);  // Chuyển hướng đến JSP
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
