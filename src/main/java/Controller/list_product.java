package Controller;

import Models.Product.ListProduct;
import Services.ServiceProduct;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.util.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(value = "/products")
public class list_product extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServiceProduct serviceProduct = new ServiceProduct();
        HttpSession session = req.getSession(true);

        int page = 1;
        int itemsPerPage = 9; // Số sản phẩm hiển thị mỗi trang
        String productName = req.getParameter("productName");
        String minPriceParam = req.getParameter("minPrice");
        String maxPriceParam = req.getParameter("maxPrice");


        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        } else if (session.getAttribute("currentPage") != null) {
            page = (int) session.getAttribute("currentPage");
        }

        // Các danh mục sản phẩm
        List<String> categories = List.of("NẤM QUÀ TẶNG", "BỘT NẤM ĂN", "NẤM DƯỢC LIỆU",
                "CHÀ BÔNG NẤM", "NẤM TƯƠI", "NẤM KHÔ", "PHÔI NẤM");

        // Đếm số lượng sản phẩm theo từng danh mục
        Map<String, Integer> categoryProductCounts = new HashMap<>();
        for (String category : categories) {
            try {
                int count = serviceProduct.getCategoryProductCounts(category);
                categoryProductCounts.put(category, count);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        try {
            ListProduct productList;
            int totalProducts = serviceProduct.getTotalProducts();
            int totalPages = (int) Math.ceil((double) totalProducts / itemsPerPage);


            if (productName != null && !productName.trim().isEmpty()) {
                productList = serviceProduct.searchProductsByName(productName);
                totalPages = (int) Math.ceil((double) productList.getItems().size() / itemsPerPage);

                // Lọc sản phẩm theo khoảng giá
            } else if (minPriceParam != null && maxPriceParam != null) {
                try {
                    double minPrice = Double.parseDouble(minPriceParam);
                    double maxPrice = Double.parseDouble(maxPriceParam);
                    productList = serviceProduct.getProductsByPriceRange(minPrice, maxPrice);
                    totalPages = (int) Math.ceil((double) productList.getItems().size() / itemsPerPage);
                } catch (NumberFormatException e) {
                    throw new RuntimeException("Giá trị minPrice hoặc maxPrice không hợp lệ", e);
                }


            } else {
                String filterType = req.getParameter("filterType");
                if (filterType == null || filterType.isEmpty()) {
                    filterType = "default";
                }
                productList = serviceProduct.getFilteredProducts(filterType, page, itemsPerPage);
            }


            session.setAttribute("listproduct", productList);
            session.setAttribute("totalPages", totalPages);
            session.setAttribute("categoryProductCounts", categoryProductCounts);
            session.setAttribute("currentPage", page);
            session.setAttribute("idCate", null);


            resp.sendRedirect("products.jsp");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}