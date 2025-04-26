package Admin;

import Services.ServiceOrder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(
        value = "/admin/updateOrderStatus"
)
public class UpdateStatusOrder  extends HttpServlet {
    ServiceOrder serviceOrder = new ServiceOrder();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int idOrder = Integer.parseInt(req.getParameter("idOrder"));
        int isActive = Integer.parseInt(req.getParameter("status"));
        serviceOrder.updateOrderStatus(idOrder,isActive);
        resp.sendRedirect("getOrderManage");
    }
}
