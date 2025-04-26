package Models.cart;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Cart {
    private List<CartProduct> items = new ArrayList<>();
    public double totalPrice;
    public double rawTotalPrice;
    public double saveMoney  ;

    public double getSaveMoney() {
        return saveMoney;
    }

    public void setSaveMoney(double saveMoney) {
        this.saveMoney = saveMoney;
    }

    public double getTotalPrice() {
        return totalPrice;
    }
    public double getRawTotalPrice() {
        return rawTotalPrice;
    }

    public void addCart(CartProduct pro) {
        // Kiểm tra nếu số lượng sản phẩm <= 0 thì không thêm vào giỏ
        if (pro.quantity <= 0) {
            System.out.println("Số lượng sản phẩm không hợp lệ!");
            return;
        }

        // Nếu sản phẩm đã tồn tại trong giỏ, cập nhật số lượng
        boolean updated = updateCart(pro);
        if (!updated) {
            // Tạo một sản phẩm mới để thêm vào giỏ
            CartProduct cartProduct = new CartProduct(
                    pro.id,
                    pro.getName(),
                    pro.price,
                    pro.quantity,
                    pro.getImg(),
                    pro.weight,
                    0,
                    pro.sale
            );

            // Tính giá trị sản phẩm
            cartProduct.rawTotal = pro.price * pro.quantity;
            cartProduct.total = (pro.price - (pro.price * pro.getSale() / 100)) * pro.quantity;

            // Thêm vào giỏ hàng
            items.add(cartProduct);
        }

        // Cập nhật lại tổng giá trị giỏ hàng
        recalculateCart();

        System.out.println(pro.rawTotal + " - Tổng tiền chưa giảm của sản phẩm vừa thêm");
        System.out.println(pro.total + " - Tổng tiền đã giảm của sản phẩm vừa thêm");
    }
    private void recalculateCart() {
        rawTotalPrice = 0;
        totalPrice = 0;

        for (CartProduct item : items) {
            rawTotalPrice += item.rawTotal;
            totalPrice += item.total;
        }

        saveMoney = rawTotalPrice - totalPrice;
    }

    public boolean updateCart(CartProduct pro) {
        for (CartProduct cart : items) {
            if (pro.id.equals(cart.id) && pro.weight == cart.weight) {

                // Nếu số lượng cập nhật <= 0, bỏ qua
                if (pro.quantity <= 0) {
                    System.out.println("Số lượng sản phẩm không hợp lệ!");
                    return false;
                }

                // Cập nhật số lượng sản phẩm
                cart.quantity += pro.quantity;

                // Nếu số lượng bằng 0 sau khi cập nhật, loại bỏ sản phẩm khỏi giỏ
                if (cart.quantity <= 0) {
                    removeCart(cart.id, String.valueOf(cart.weight));
                    return true;
                }

                // Tính lại giá sản phẩm sau khi cập nhật số lượng
                cart.rawTotal = cart.price * cart.quantity;
                cart.total = (cart.price - (cart.price * cart.getSale() / 100)) * cart.quantity;

                // Tính lại toàn bộ giá trị của giỏ hàng
                rawTotalPrice = 0;
                totalPrice = 0;
                saveMoney = 0;

                for (CartProduct item : items) {
                    rawTotalPrice += item.rawTotal;
                    totalPrice += item.total;
                }

                saveMoney = rawTotalPrice - totalPrice;

                System.out.println(cart.rawTotal + " - Tổng tiền chưa giảm của sản phẩm trong giỏ");
                System.out.println(cart.total + " - Tổng tiền đã giảm của sản phẩm trong giỏ");

                return true;
            }
        }
        return false;
    }


    public boolean removeCart(String id, String weight) {
        Iterator<CartProduct> iterator = items.iterator();
        while (iterator.hasNext()) {
            CartProduct cart = iterator.next();
            if (cart.id.equals(id) && cart.weight == Integer.parseInt(weight)) {
                rawTotalPrice -= cart.rawTotal;
                totalPrice -= cart.total;
                saveMoney = rawTotalPrice - totalPrice;

                iterator.remove(); // Xóa phần tử an toàn

                if (items.isEmpty()) {
                    rawTotalPrice = 0;
                    totalPrice = 0;
                    saveMoney = 0;
                }
                return true;
            }
        }
        return false;
    }

    public List<CartProduct> getItems() {
        return items != null ? items : new ArrayList<>();
    }
}