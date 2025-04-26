document.addEventListener('DOMContentLoaded', () => {
    // Lấy danh sách các nút trong bảng
    const viewButtons = document.querySelectorAll('button[data-bs-target="#viewOrderModal"]');
    const updateStatusButtons = document.querySelectorAll('button[data-bs-target="#updateStatusModal"]');
    const deleteButtons = document.querySelectorAll('button[data-bs-target="#deleteOrderModal"]');

    // Hàm hiển thị chi tiết đơn hàng
    viewButtons.forEach(button => {
        button.addEventListener('click', () => {
            const row = button.closest('tr');
            const orderId = row.cells[1].innerText;
            const customerName = row.cells[2].innerText;
            const products = row.cells[3].innerText;
            const totalAmount = row.cells[4].innerText;
            const status = row.cells[5].innerText;
            const orderDate = row.cells[6].innerText;

            document.querySelector('#viewOrderModal h6').innerText = `Mã đơn hàng: ${orderId}`;
            document.querySelector('#viewOrderModal .modal-body').innerHTML = `
                <p><strong>Khách hàng:</strong> ${customerName}</p>
                <p><strong>Sản phẩm:</strong> ${products}</p>
                <p><strong>Tổng tiền:</strong> ${totalAmount}</p>
                <p><strong>Trạng thái:</strong> ${status}</p>
                <p><strong>Ngày đặt:</strong> ${orderDate}</p>
                <p><strong>Địa chỉ giao hàng:</strong> 123 Đường ABC, Quận 1, TP. HCM</p>
            `;
        });
    });

    // Hàm cập nhật trạng thái đơn hàng
    updateStatusButtons.forEach(button => {
        button.addEventListener('click', () => {
            const row = button.closest('tr');
            const orderId = row.cells[1].innerText;

            document.querySelector('#updateStatusModal .modal-title').innerText = `Cập nhật trạng thái cho đơn hàng ${orderId}`;
            const confirmButton = document.querySelector('#updateStatusModal button.btn-primary');

            confirmButton.addEventListener('click', () => {
                const selectedStatus = document.querySelector('#orderStatus').value; // Giá trị trạng thái đã chọn
                row.cells[5].innerText = selectedStatus; // Cập nhật trạng thái trong bảng

                alert(`Trạng thái đơn hàng ${orderId} đã được cập nhật thành công thành "${selectedStatus}"!`);

                // Đóng modal và xóa lớp nền (backdrop)
                const modal = bootstrap.Modal.getInstance(document.getElementById('updateStatusModal'));
                modal.hide();

                // Xóa lớp nền nếu cần
                document.querySelectorAll('.modal-backdrop').forEach(backdrop => {
                    backdrop.remove();
                });
            }, { once: true });
        });
    });

    // Hàm xóa đơn hàng
    deleteButtons.forEach(button => {
        button.addEventListener('click', () => {
            const row = button.closest('tr');
            const orderId = row.cells[1].innerText;

            document.querySelector('#deleteOrderModal button.btn-danger').addEventListener('click', () => {
                row.remove();
                alert(`Đơn hàng ${orderId} đã được xóa thành công!`);

                // Đóng modal và xóa lớp nền (backdrop)
                const modal = bootstrap.Modal.getInstance(document.getElementById('deleteOrderModal'));
                modal.hide();

                // Xóa lớp nền nếu cần
                document.querySelectorAll('.modal-backdrop').forEach(backdrop => {
                    backdrop.remove();
                });
            }, { once: true });
        });
    });
});
