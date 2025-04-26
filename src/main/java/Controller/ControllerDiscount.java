package Controller;

import Models.Discount.Discount;
import Services.ServiceDiscount;
import com.google.gson.Gson;
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

@WebServlet("/discounts")
public class ControllerDiscount  extends HttpServlet {
    private ServiceDiscount serviceDiscount = new ServiceDiscount();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        int idUser = (int) session.getAttribute("idUser");
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        List<Discount> discounts = null;
        try {
            discounts = serviceDiscount.getDiscountsByUserRank(idUser);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        Gson gson = new Gson();
        String json = gson.toJson(discounts);
        resp.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        int idUser = (int) session.getAttribute("idUser");
        String discountCode = req.getParameter("discountCode");
        System.out.println(discountCode + "magiam gia");
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        Discount discount = null;
        try {
            discount = serviceDiscount.getDiscountByUserRank(discountCode, idUser);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        // Kiểm tra xem discount có hợp lệ không
        Map<String, Object> responseMessage = new HashMap<>();
        if (discount != null) {
            // Nếu tìm thấy mã giảm giá hợp lệ
            responseMessage.put("success", true);
            responseMessage.put("discountAmount", discount.getDiscountAmount());  // Trả về số tiền giảm giá
        } else {
            // Nếu không hợp lệ
            responseMessage.put("success", false);
        }

// Chuyển map thành JSON và gửi phản hồi về client
        Gson gson = new Gson();
        String jsonResponse = gson.toJson(responseMessage);
        resp.getWriter().write(jsonResponse);
    }

}
