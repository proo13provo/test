package Controller.User;

import Services.ServiceUser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Date;

@WebServlet(
        value = "/ProfileServlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,     // 10MB
        maxRequestSize = 1024 * 1024 * 50   // 50MB
)
public class UpdateUser extends HttpServlet {
    private static final String UPLOAD_DIR = "img"; // Thư mục lưu ảnh
    ServiceUser serviceUser = new ServiceUser();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session  = request.getSession(true);
        int idUser = (int) session.getAttribute("idUser");
        // Lấy giá trị từ form
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String birthdate = request.getParameter("birthdate");
        String address = request.getParameter("address");

        // Thư mục gốc của dự án (real path)
        String appPath = request.getServletContext().getRealPath("");
        String uploadPath = appPath + File.separator + UPLOAD_DIR;

        // Tạo thư mục nếu chưa tồn tại
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Xử lý file upload
        Part filePart = request.getPart("avatar"); // Lấy file từ form
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String filePath = uploadPath + File.separator + fileName;

        // Lưu file vào thư mục
        if (fileName != null && !fileName.isEmpty()) {
            filePart.write(filePath);
        }
if(serviceUser.updateUserInfo(idUser,name,phone,address, Date.valueOf(birthdate),fileName)){
    response.sendRedirect("getUser");
}else {
    System.out.println("Loi roi kia");
}



    }
}
