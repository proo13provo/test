package Controller.OrderDetailManage;

import Models.OrderManage.ListOrder;
import Services.ServiceOrder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(
        value = "/getOrderDetailManage"
)
public class getOrderDetailManage extends HttpServlet {
    ServiceOrder serviceOrder = new ServiceOrder();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        int idOrder = Integer.parseInt(req.getParameter("idOrder"));
        try {
            ListOrder order = serviceOrder.getOrderById(idOrder);
            session.setAttribute("order_detail_manage",order);
            resp.sendRedirect("admin/order_detail.jsp");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }
}
