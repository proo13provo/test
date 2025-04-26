package Admin;

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
        value = "/admin/getOrderManage"
)
public class getOrderManage  extends HttpServlet {
    ServiceOrder serviceOrder = new ServiceOrder();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ListOrder items ;
        HttpSession session = req.getSession(true);


            try {
                items = serviceOrder.getAllOrders();
                System.out.println(items.getItems().size());
                session.setAttribute("order_manage",items);
                resp.sendRedirect("manage-order.jsp");
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }




    }
}
