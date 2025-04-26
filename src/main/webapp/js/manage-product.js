
function openAddProductForm() {
    const addProductModal = new bootstrap.Modal(document.getElementById('addProductModal'));
    addProductModal.show();
}

function editProduct(productId) {
    // Hiển thị modal sửa sản phẩm với thông tin mẫu
    const editProductModal = new bootstrap.Modal(document.getElementById('editProductModal'));
    document.getElementById('editProductName').value = `Sản phẩm ${productId}`;
    document.getElementById('editProductPrice').value = productId * 10000;
    document.getElementById('editProductQuantity').value = 50 - productId;
    editProductModal.show();
}

function deleteProduct(productId) {
    if (confirm(`Bạn có chắc chắn muốn xoá sản phẩm ${productId}?`)) {
        alert(`Đã xoá sản phẩm ${productId}`);
    }
}

document.addEventListener('DOMContentLoaded', () => {
    const editModal = document.getElementById('editModal');
    const deleteModal = document.getElementById('deleteModal');

    // Biến để lưu trữ thông tin sản phẩm hiện tại
    let currentEditRow = null;

    // Xử lý nút "Sửa"
    document.querySelectorAll('button[data-bs-target="#editModal"]').forEach((button, index) => {
        button.addEventListener('click', () => {
            // Xác định hàng hiện tại
            const row = button.closest('tr');
            currentEditRow = row;

            // Lấy thông tin sản phẩm từ hàng
            const productName = row.cells[1].innerText;
            const productPrice = row.cells[2].innerText.replace('đ', '').replace(/,/g, '');
            const productQuantity = row.cells[3].innerText;
            const productImage = row.cells[4].innerText;
            const productDescription = row.cells[5].innerText;
            const productSupplier = row.cells[6].innerText;
            const productCategory = row.cells[7].innerText;
            const productStatus = row.cells[8].innerText;

            // Hiển thị thông tin lên modal
            document.getElementById('productName').value = productName;
            document.getElementById('productPrice').value = productPrice;
            document.getElementById('productQuantity').value = productQuantity;
            document.getElementById('productImage').value = productImage;
            document.getElementById('productDescription').value = productDescription;
            document.getElementById('productSupplier').value = productSupplier;
            document.getElementById('productCategory').value = productCategory;
            document.getElementById('productStatus').value = productStatus;

            // Mở modal chỉnh sửa sản phẩm
            const editProductModal = new bootstrap.Modal(document.getElementById('editProductModal'));
            editProductModal.show();
        });
    });

    // Lưu thay đổi sau khi nhấn "Lưu thay đổi"
    document.querySelector('#editModal .btn-primary').addEventListener('click', (event) => {
        event.preventDefault();

        if (!currentEditRow) return;

        // Lấy dữ liệu từ modal
        const updatedName = document.getElementById('productName').value;
        const updatedPrice = document.getElementById('productPrice').value;
        const updatedQuantity = document.getElementById('productQuantity').value;
        const updatedImage = document.getElementById('productImage').value;
        const updatedDescription = document.getElementById('productDescription').value;
        const updatedSupplier = document.getElementById('productSupplier').value;
        const updatedCategory = document.getElementById('productCategory').value;
        const updatedStatus = document.getElementById('productStatus').value;

        // Cập nhật lại bảng
        currentEditRow.cells[1].innerText = updatedName;
        currentEditRow.cells[2].innerText = `${Number(updatedPrice).toLocaleString()}đ`;
        currentEditRow.cells[3].innerText = updatedQuantity;
        currentEditRow.cells[4].innerText = updatedImage;
        currentEditRow.cells[5].innerText = updatedDescription;
        currentEditRow.cells[6].innerText = updatedSupplier;
        currentEditRow.cells[7].innerText = updatedCategory;
        currentEditRow.cells[8].innerText = updatedStatus;

        // Đóng modal
        const modal = bootstrap.Modal.getInstance(editModal);
        modal.hide();

        // Reset currentEditRow
        currentEditRow = null;

        // Hiển thị thông báo
        alert('Sản phẩm đã được cập nhật thành công!');
    });

    // Xử lý nút "Xóa"
    document.querySelectorAll('button[data-bs-target="#deleteModal"]').forEach((button, index) => {
        button.addEventListener('click', () => {
            // Xác định hàng hiện tại
            const row = button.closest('tr');

            // Xóa sản phẩm khi nhấn nút "Xóa" trong modal
            const confirmDeleteButton = document.querySelector('#deleteModal .btn-danger');
            confirmDeleteButton.onclick = () => {
                row.remove();

                // Đóng modal
                const modal = bootstrap.Modal.getInstance(deleteModal);
                modal.hide();

                // Hiển thị thông báo
                alert('Sản phẩm đã được xóa thành công!');
            };

            // Mở modal xác nhận xóa
            const deleteProductModal = new bootstrap.Modal(document.getElementById('deleteModal'));
            deleteProductModal.show();
        });
    });
});
// Hàm thêm biến thể sản phẩm
// Hàm xử lý Thêm và Xóa biến thể

