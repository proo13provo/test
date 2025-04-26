package Admin;

import Dao.ActivityLogDAO;
import Models.Log.ActivityLog;
import Models.User.User;
import Services.ServiceUser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(
        value = "/admin/change_info"
)
public class ChangeInforUser extends HttpServlet {
    ServiceUser serviceUser = new ServiceUser();
    private ActivityLogDAO logDAO;

    public void init() {
        logDAO = new ActivityLogDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        try {
            // Lấy thông tin admin thực hiện thay đổi
            User admin = (User) session.getAttribute("userInfor");
            String adminUsername = admin != null ? admin.getEmail() : "unknown";

            int idUser = Integer.parseInt(req.getParameter("idUser"));
            int idRole1 = Integer.parseInt(req.getParameter("role"));
            int isActive = Integer.parseInt(req.getParameter("state"));
            boolean is = isActive == 1;
            System.out.println(isActive);
            String name = req.getParameter("name");

            // Lấy thông tin user trước khi cập nhật
            User userBeforeUpdate = serviceUser.getUserById(idUser);
            
            if (serviceUser.updateUser(idUser, idRole1, name, is)) {
                // Ghi log thành công
                String logDescription = String.format(
                    "Cập nhật thông tin người dùng - ID: %d, Tên: %s, Role: %d, Trạng thái: %s",
                    idUser, name, idRole1, is ? "Kích hoạt" : "Vô hiệu hóa"
                );

                ActivityLog activityLog = new ActivityLog(
                    adminUsername,
                    "Admin",
                    "UPDATE_USER_INFO",
                    logDescription,
                    Long.valueOf(idUser)
                );
                logDAO.saveLog(activityLog);

                session.setAttribute("successMessage", "Cập nhật thông tin thành công!");
            } else {
                // Ghi log thất bại
                logError(session, "UPDATE_USER_FAILED", 
                    "Không thể cập nhật thông tin người dùng ID: " + idUser);
                session.setAttribute("errorMessage", "Cập nhật thông tin thất bại!");
            }

            resp.sendRedirect("getAllUser");
        } catch (Exception e) {
            // Ghi log lỗi
            logError(session, "ERROR_UPDATE_USER", "Lỗi khi cập nhật thông tin: " + e.getMessage());
            session.setAttribute("errorMessage", "Đã xảy ra lỗi!");
            resp.sendRedirect("getAllUser");
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
