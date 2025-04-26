package Controller.Quantity;

import Models.cart.Cart;
import Models.cart.CartProduct;
import Services.ServiceProduct;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(
        value = "/checkQuantitySub"
)

public class CheckQuantityProductSub extends HttpServlet {
    ServiceProduct serviceProduct = new ServiceProduct();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int idProduct = Integer.parseInt(req.getParameter("productID"));
            int weight = Integer.parseInt(req.getParameter("weight"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));

            HttpSession session = req.getSession(true);
            Cart cart = (Cart) session.getAttribute("cr7");

            // Kiểm tra giỏ hàng hợp lệ
            if (cart == null) {
                cart = new Cart(); // Tạo giỏ hàng mới nếu chưa có
                session.setAttribute("cr7", cart);
            }

            if (cart.getItems() == null || cart.getItems().isEmpty()) {
                System.out.println("Giỏ hàng chưa có sản phẩm.");
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Giỏ hàng chưa được khởi tạo.");
                return;
            }

            // Tìm sản phẩm trong giỏ và cập nhật số lượng
            CartProduct productToRemove = null;
            for (CartProduct pro : cart.getItems()) {
                if (pro.getId().equals(String.valueOf(idProduct)) && pro.weight == weight) {
                    pro.quantity--;

                    // Cập nhật giá trị tổng của sản phẩm
                    pro.rawTotal = pro.price * pro.quantity;
                    pro.total = (pro.price - (pro.price * pro.getSale() / 100)) * pro.quantity;

                    // Nếu số lượng bằng 0, đánh dấu sản phẩm để xóa
                    if (pro.quantity <= 0) {
                        productToRemove = pro;
                    }
                    break;
                }
            }

            // Xóa sản phẩm ngoài vòng lặp để tránh ConcurrentModificationException
            if (productToRemove != null) {
                cart.getItems().remove(productToRemove);
            }

            // Cập nhật lại toàn bộ giỏ hàng
            recalculateCart(cart);

            // Lưu lại giỏ hàng vào session
            session.setAttribute("cr7", cart);
            resp.sendRedirect("shoppingCart.jsp");

        } catch (NumberFormatException e) {
            System.out.println("Lỗi chuyển đổi tham số: " + e.getMessage());
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Dữ liệu không hợp lệ.");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi không mong muốn.");
        }
    }
    private void recalculateCart(Cart cart) {
        cart.rawTotalPrice = 0;
        cart.totalPrice = 0;

        for (CartProduct item : cart.getItems()) {
            cart.rawTotalPrice += item.rawTotal;
            cart.totalPrice += item.total;
        }

        cart.saveMoney = cart.rawTotalPrice - cart.totalPrice;

    }

}
