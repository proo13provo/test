document.addEventListener("DOMContentLoaded", () => {
    const viewOrderModal = document.getElementById("viewOrderModal");
    const modalBody = viewOrderModal.querySelector(".modal-body");

    viewOrderModal.addEventListener("show.bs.modal", (event) => {
        const button = event.relatedTarget; // Nút bấm "Xem"
        const orderId = button.getAttribute("data-order-id");

        // Tìm thông tin đơn hàng từ danh sách `orders`
        const order = orders.find(o => o.id == orderId);

        if (order) {
            modalBody.innerHTML = `
                <p><strong>Mã đơn hàng:</strong> #ORD${order.id}</p>
                <p><strong>Khách hàng:</strong> ${order.nameUser}</p>
                <p><strong>Sản phẩm:</strong> ${order.productName}</p>
                <p><strong>Tổng tiền:</strong> ${order.totalPrice} VND</p>
                <p><strong>Trạng thái:</strong> ${order.state}</p>
                <p><strong>Ngày đặt:</strong> ${order.createDate}</p>
                <p><strong>Địa chỉ giao hàng:</strong> ${order.receiveAddress}</p>
            `;
        }
    });
});