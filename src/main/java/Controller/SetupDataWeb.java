package Controller;

import Models.Category.Category;
import Models.TopProductBuy.TopProduct;
import Services.ServiceAddCategories;
import Services.ServiceProduct;
import Services.ServiceTopProductBuy;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(
        value = "/setupData"
)
public class SetupDataWeb extends HttpServlet {
    Category item = new Category();
    ServiceAddCategories categories = new ServiceAddCategories();
    ServiceTopProductBuy serviceTopProductBuy = new ServiceTopProductBuy();
    ServiceProduct serviceProduct = new ServiceProduct();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        try {
            item =  categories.getCategories();
            TopProduct product = serviceTopProductBuy.getTop5BestSellingProducts();
            if(product != null){
                session = req.getSession(true);
                session.setAttribute("topproduct",product);

            }
            TopProduct productNew = serviceProduct.getLatestProducts();
            if(productNew != null){
                 session = req.getSession(true);
                session.setAttribute("product_new",productNew);

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        List<String> categories = List.of("NẤM QUÀ TẶNG", "BỘT NẤM ĂN", "NẤM DƯỢC LIỆU", "CHÀ BÔNG NẤM", "NẤM TƯƠI", "NẤM KHÔ", "PHÔI NẤM");

        // số lượng sản phẩm cho theo loại danh mục
        Map<String, Integer> categoryProductCounts = new HashMap<>();
        for (String category : categories) {
            try {
                int count = serviceProduct.getCategoryProductCounts(category);
                categoryProductCounts.put(category, count);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        session.setAttribute("categoryProductCounts", categoryProductCounts);

      session = req.getSession(true);
        session.setAttribute("categories",item);
        resp.sendRedirect("index.jsp");
    }
}
