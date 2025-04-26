package Admin;


import Services.ServiceAddProduct;
import Services.ServiceProduct;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;


@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB: Kích thước file tối thiểu để lưu tạm
        maxFileSize = 1024 * 1024 * 10,      // 10MB: Kích thước tối đa cho mỗi file
        maxRequestSize = 1024 * 1024 * 50    // 50MB: Tổng kích thước request tối đa
)
@WebServlet(value = "/admin/addProduct")
public class Manage_addProduct extends HttpServlet {

    private final ServiceAddProduct productService = new ServiceAddProduct();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            // 1. Lấy dữ liệu từ form
            String productName = req.getParameter("product_Name");
            float productPrice = parseFloatSafe(req.getParameter("product_Price"), 0);
            int productQuantity = parseIntSafe(req.getParameter("product_Quantity"), 0);
            String productDescription = req.getParameter("product_Description");
            String productSupplier = req.getParameter("product_Supplier");
            String productCategory = req.getParameter("product_Category");
            String productStatus = req.getParameter("product_Status");
            String salePercentStr = req.getParameter("sale_Percent");
            String saleStartDate = req.getParameter("sale_StartDate");
            String saleEndDate = req.getParameter("sale_EndDate");
            String productWeightStr = req.getParameter("product_Weight");

            // 2. Xử lý logic
            int productId = productService.addOrUpdateProduct(productName, productCategory, productSupplier, productStatus);

            // 3. Xử lý upload ảnh
            processImages(req, productId);

            // 4. Thêm biến thể sản phẩm và khuyến mãi
            if (productWeightStr != null && !productWeightStr.isEmpty()) {
                float productWeight = Float.parseFloat(productWeightStr);
                int variantId = productService.addProductVariant(productId, productWeight, productPrice, productDescription, productQuantity);

                if (salePercentStr != null && !salePercentStr.isEmpty()) {
                    int salePercent = Integer.parseInt(salePercentStr);
                    productService.addSale(variantId, salePercent, saleStartDate, saleEndDate);
                }
            }

            // Chuyển hướng sau khi thành công
            resp.sendRedirect("../getCategory");
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Có lỗi xảy ra: " + e.getMessage());
        }
    }

    private void processImages(HttpServletRequest req, int productId) throws IOException, ServletException, SQLException {
        String uploadPath = getServletContext().getRealPath("") + "img";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String[] imageFields = {"product_Image1", "product_Image2", "product_Image3", "product_Image4"};
        for (String fieldName : imageFields) {
            Part filePart = req.getPart(fieldName);
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String uniqueFileName = System.currentTimeMillis() + "_" + fileName;
                String filePath = uploadPath + File.separator + uniqueFileName;

                try (InputStream fileContent = filePart.getInputStream()) {
                    Files.copy(fileContent, Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
                }

                productService.addImage(productId, uniqueFileName);
            }
        }
    }

    private float parseFloatSafe(String str, float defaultValue) {
        try {
            return Float.parseFloat(str);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    private int parseIntSafe(String str, int defaultValue) {
        try {
            return Integer.parseInt(str);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }
}
