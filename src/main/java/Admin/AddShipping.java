package Admin;

import Dao.ActivityLogDAO;
import Models.Log.ActivityLog;
import Models.User.User;
import Services.ServiceShipping;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(value = "/admin/addShipping")
public class AddShipping extends HttpServlet {
    ServiceShipping serviceShipping = new ServiceShipping();
    private ActivityLogDAO logDAO;

    public void init() {
        logDAO = new ActivityLogDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        
        try {
            User admin = (User) session.getAttribute("userInfor");
            String adminUsername = admin != null ? admin.getEmail() : "unknown";

            String nameShipping = req.getParameter("deliveryService");
            double price = Double.parseDouble(req.getParameter("price"));

            serviceShipping.addShipping(nameShipping, price);

            // Ghi log thành công
            String logDescription = String.format(
                "Thêm phương thức vận chuyển mới - Tên: %s, Giá: %.2f",
                nameShipping, price
            );

            ActivityLog activityLog = new ActivityLog(
                adminUsername,
                "Admin",
                "ADD_SHIPPING",
                logDescription,
                null
            );
            logDAO.saveLog(activityLog);

            req.setAttribute("successMessage", "Thêm phương thức vận chuyển thành công!");
            RequestDispatcher dispatcher = req.getRequestDispatcher("dilivery.jsp");
            dispatcher.forward(req, resp);

        } catch (SQLException e) {
            // Ghi log lỗi
            logError(session, "SQL_ERROR", "Lỗi khi thêm phương thức vận chuyển: " + e.getMessage());
            req.setAttribute("errorMessage", "Lỗi khi thêm phương thức vận chuyển!");
            RequestDispatcher dispatcher = req.getRequestDispatcher("dilivery.jsp");
            dispatcher.forward(req, resp);
        } catch (Exception e) {
            // Ghi log lỗi khác
            logError(session, "ERROR_ADD_SHIPPING", "Lỗi không xác định: " + e.getMessage());
            req.setAttribute("errorMessage", "Đã xảy ra lỗi!");
            RequestDispatcher dispatcher = req.getRequestDispatcher("dilivery.jsp");
            dispatcher.forward(req, resp);
        }
    }

    private void logError(HttpSession session, String actionType, String description) {
        try {
            User admin = (User) session.getAttribute("userInfor");
            String adminUsername = admin != null ? admin.getEmail() : "unknown";

            ActivityLog errorLog = new ActivityLog(
                adminUsername,
                "Admin",
                actionType,
                description,
                null
            );
            logDAO.saveLog(errorLog);
        } catch (Exception e) {
            System.err.println("Không thể ghi log lỗi: " + e.getMessage());
        }
    }
}