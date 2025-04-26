document.addEventListener('DOMContentLoaded', () => {
    // Lấy danh sách các nút "Phản hồi" và "Xóa"
    const respondButtons = document.querySelectorAll('button[data-bs-toggle="modal"][data-bs-target="#respondModal"]');
    const deleteButtons = document.querySelectorAll('button[data-bs-toggle="modal"][data-bs-target="#deleteModal"]');

    // Hàm hiển thị modal phản hồi và điền thông tin đánh giá
    respondButtons.forEach(button => {
        button.addEventListener('click', () => {
            const row = button.closest('tr');
            const customerName = row.cells[1].innerText;
            const productName = row.cells[2].innerText;
            const reviewText = row.cells[3].innerText;
            const reviewDate = row.cells[4].innerText;
            const status = row.cells[5].innerText;

            // Cập nhật tiêu đề modal và nội dung thông tin đánh giá
            document.querySelector('#respondModalLabel').innerText = `Phản hồi đánh giá của ${customerName}`;
            document.querySelector('#respondModal .modal-body').innerHTML = `
                <p><strong>Sản phẩm:</strong> ${productName}</p>
                <p><strong>Đánh giá:</strong> ${reviewText}</p>
                <p><strong>Ngày đánh giá:</strong> ${reviewDate}</p>
                <textarea class="form-control" id="responseText" rows="5" placeholder="Nhập phản hồi của bạn tại đây..."></textarea>
            `;
        });
    });

    // Hàm gửi phản hồi
    document.querySelector('#respondModal .btn-primary').addEventListener('click', () => {
        const responseText = document.querySelector('#responseText').value; // Lấy phản hồi của admin
        if (responseText.trim() === "") {
            alert("Vui lòng nhập phản hồi trước khi gửi.");
            return;
        }

        // Thực hiện gửi phản hồi (Ở đây ta chỉ hiển thị thông báo, thực tế có thể gửi tới server)
        alert("Phản hồi đã được gửi thành công!");

        // Đóng modal và xóa lớp nền (backdrop)
        const modal = bootstrap.Modal.getInstance(document.getElementById('respondModal'));
        modal.hide();

        // Xóa lớp nền nếu cần
        document.querySelectorAll('.modal-backdrop').forEach(backdrop => {
            backdrop.remove();
        });
    });

    // Hàm xóa đánh giá
    deleteButtons.forEach(button => {
        button.addEventListener('click', () => {
            const row = button.closest('tr');
            const reviewId = row.cells[0].innerText; // Lấy ID đánh giá nếu cần

            // Hiển thị xác nhận trước khi xóa
            document.querySelector('#deleteModal .btn-danger').addEventListener('click', () => {
                row.remove();
                alert(`Đánh giá ${reviewId} đã được xóa thành công!`);

                // Đóng modal và xóa lớp nền (backdrop)
                const modal = bootstrap.Modal.getInstance(document.getElementById('deleteModal'));
                modal.hide();

                // Xóa lớp nền nếu cần
                document.querySelectorAll('.modal-backdrop').forEach(backdrop => {
                    backdrop.remove();
                });
            }, { once: true });
        });
    });
});
