package Controller.Shippingfee;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class Shippingfee extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String shippingMethod = req.getParameter("shippingMethod");

        // Lưu vào session để giữ lại lựa chọn
        if (shippingMethod != null) {
            req.getSession().setAttribute("selectedShippingMethod", shippingMethod);
            req.getRequestDispatcher("CheckoutServlet").forward(req,resp);
        }
    }
}
