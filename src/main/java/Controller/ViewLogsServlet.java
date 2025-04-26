package Controller;

import Dao.ActivityLogDAO;
import Models.Log.ActivityLog;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/admin/logs")
public class ViewLogsServlet extends HttpServlet {
    private ActivityLogDAO logDAO;

    public void init() {
        logDAO = new ActivityLogDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            List<ActivityLog> logs;

            if (action != null) {
                switch (action) {
                    case "byUser":
                        String username = request.getParameter("username");
                        logs = logDAO.getLogsByUsername(username);
                        break;
                    case "byDate":
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        Date startDate = sdf.parse(request.getParameter("startDate"));
                        Date endDate = sdf.parse(request.getParameter("endDate"));
                        logs = logDAO.getLogsByDateRange(startDate, endDate);
                        break;
                    case "byType":
                        String actionType = request.getParameter("actionType");
                        logs = logDAO.getLogsByType(actionType);
                        break;
                    default:
                        logs = logDAO.getAllLogs();
                }
            } else {
                logs = logDAO.getAllLogs();
            }

            request.setAttribute("logs", logs);
            request.getRequestDispatcher("/admin/viewLogs.jsp").forward(request, response);

        } catch (SQLException | ParseException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}