package Controller;

import Models.Shipping.Shipping;
import Services.ServiceShipping;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(
        value = "/getShipping"
)
public class GetShipping extends HttpServlet {
    ServiceShipping serviceShipping = new ServiceShipping();
    public Shipping items;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        Integer idUser = (Integer) session.getAttribute("idUser");
        if(idUser == null){
            resp.sendRedirect("Account/login.jsp");
        }else{
            try {
                items= serviceShipping.getShipping();
                System.out.println(items.shippingdetailList.size());
                session = req.getSession(true);
                session.setAttribute("totalship",items);
                resp.sendRedirect("thanhtoan.jsp");
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }


    }


}
