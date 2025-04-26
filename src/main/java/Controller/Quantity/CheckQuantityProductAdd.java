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

@WebServlet(value = "/checkQuantityAdd")
public class CheckQuantityProductAdd extends HttpServlet {
    ServiceProduct serviceProduct = new ServiceProduct();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int idProduct = Integer.parseInt(req.getParameter("productID"));
            int weight = Integer.parseInt(req.getParameter("weight"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));

            HttpSession session = req.getSession(true);
            Cart cart = (Cart) session.getAttribute("cr7");

            // Kiểm tra giỏ hàng có tồn tại hay không
            if (cart == null) {
                cart = new Cart(); // Tạo giỏ hàng mới nếu chưa có
                session.setAttribute("cr7", cart);
            }

            // Kiểm tra danh sách sản phẩm trong giỏ hàng
            if (cart.getItems() == null) {
                System.out.println("Giỏ hàng chưa có sản phẩm.");
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Giỏ hàng chưa được khởi tạo.");
                return;
            }

            // Kiểm tra số lượng tối đa của sản phẩm trong kho
            int checkQuantity = serviceProduct.getProductVariantCountByIdAndWeight(idProduct, weight);

            if (quantity < checkQuantity) {
                for (CartProduct pro : cart.getItems()) {
                    if (pro.getId().equals(String.valueOf(idProduct)) && pro.weight == weight) {
                        pro.quantity++; // Tăng số lượng sản phẩm lên 1

                        // Cập nhật giá trị tổng của sản phẩm
                        pro.rawTotal = pro.price * pro.quantity;
                        pro.total = (pro.price - (pro.price * pro.getSale() / 100)) * pro.quantity;

                        // Cập nhật lại toàn bộ giỏ hàng
                        recalculateCart(cart);
                        break; // Dừng vòng lặp sau khi cập nhật
                    }
                }
            }

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