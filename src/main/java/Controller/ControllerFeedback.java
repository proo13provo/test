package Controller;

import Services.ServiceFeedback;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@WebServlet("/feedbacks")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,  // 1MB
        maxFileSize = 1024 * 1024 * 5,    // 5MB per file
        maxRequestSize = 1024 * 1024 * 20 // 20MB total
)
public class ControllerFeedback extends HttpServlet {
    private ServiceFeedback serviceFeedback = new ServiceFeedback();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("có vào from khong");
        // Lấy thông tin từ form
        String productId = req.getParameter("productId");
        String orderId = req.getParameter("orderId");
        String status = req.getParameter("status");
        String comment = req.getParameter("comment");
        String stars = req.getParameter("stars");
        System.out.println("Product ID: " + productId);
        System.out.println("Order ID: " + orderId);
        System.out.println("Status: " + status);
        System.out.println("Comment: " + comment);
        System.out.println("Stars: " + stars);



        // Kiểm tra đầu vào nếu cần
        if (comment == null || comment.length() < 20) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Nhận xét quá ngắn");
            return;
        }

        // Lấy file ảnh upload
        Collection<Part> parts = req.getParts();
        List<String> savedImagePaths = new ArrayList<>();

        for (Part part : parts) {
            if (part.getName().equals("images") && part.getSize() > 0) {
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                String uploadPath = getServletContext().getRealPath("") + File.separator + "img";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();

                String filePath = uploadPath + File.separator + fileName;
                part.write(filePath);

                // Lưu path tương đối hoặc tên file để lưu vào DB
                savedImagePaths.add(fileName);
            }
        }

        try {
            int idOrderDetail = serviceFeedback.getIdOrderDetails(orderId, productId);
        int idFeedback =     serviceFeedback.insertReview(comment, idOrderDetail, Integer.parseInt(stars), status);
            for (String img: savedImagePaths
                 ) {
                serviceFeedback.insertFeedbackImage(idFeedback,img);

            }

            // Chuyển hướng về history.jsp với thông báo thành công
            resp.sendRedirect("history.jsp?success=true");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("history.jsp?success=false");
        }
    }
}
