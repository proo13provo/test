document.addEventListener("DOMContentLoaded", function () {
    const tableBody = document.querySelector("table tbody");
    let editingRow, deletingRow;

    // Thêm chương trình khuyến mãi
    document.querySelector("#addPromotionModal .btn-primary").addEventListener("click", function () {
        const promotionName = document.getElementById("promotionName").value;
        const promotionDescription = document.getElementById("promotionDescription").value;
        const promotionDiscount = document.getElementById("promotionDiscount").value;
        const startDate = document.getElementById("startDate").value;
        const endDate = document.getElementById("endDate").value;

        if (!promotionName || !promotionDiscount || !startDate || !endDate) {
            alert("Vui lòng điền đầy đủ thông tin!");
            return;
        }

        // Thêm dòng mới vào bảng
        const rowCount = tableBody.rows.length;
        const newRow = `
            <tr>
                <td>${rowCount + 1}</td>
                <td>${promotionName}</td>
                <td>${promotionDescription}</td>
                <td>${promotionDiscount}%</td>
                <td>${startDate}</td>
                <td>${endDate}</td>
                <td>
                    <button class="btn btn-primary btn-sm edit-btn" data-bs-toggle="modal" data-bs-target="#editPromotionModal">Sửa</button>
                    <button class="btn btn-danger btn-sm delete-btn" data-bs-toggle="modal" data-bs-target="#deletePromotionModal">Xóa</button>
                </td>
            </tr>`;
        tableBody.insertAdjacentHTML("beforeend", newRow);

        alert("Thêm chương trình khuyến mãi thành công!");
        document.querySelector("#addPromotionModal .btn-close").click();
    });

    // Xử lý sửa chương trình khuyến mãi
    tableBody.addEventListener('click', function (e) {
        const target = e.target;

        // Xử lý khi nhấn nút Sửa
        if (target.classList.contains('edit-btn')) {
            editingRow = target.closest('tr');
            const cells = editingRow.querySelectorAll('td');

            document.getElementById("editPromotionName").value = cells[1].textContent;
            document.getElementById("editPromotionDescription").value = cells[2].textContent;
            document.getElementById("editPromotionDiscount").value = parseInt(cells[3].textContent);
            document.getElementById("editStartDate").value = cells[4].textContent;
            document.getElementById("editEndDate").value = cells[5].textContent;
        }

        // Xử lý khi nhấn nút Xóa
        if (target.classList.contains('delete-btn')) {
            deletingRow = target.closest('tr');
        }
    });

    // Cập nhật chương trình khuyến mãi
    document.querySelector("#editPromotionModal .btn-primary").addEventListener("click", function () {
        if (!editingRow) return;

        const promotionName = document.getElementById("editPromotionName").value;
        const promotionDescription = document.getElementById("editPromotionDescription").value;
        const promotionDiscount = document.getElementById("editPromotionDiscount").value;
        const startDate = document.getElementById("editStartDate").value;
        const endDate = document.getElementById("editEndDate").value;

        if (!promotionName || !promotionDiscount || !startDate || !endDate) {
            alert("Vui lòng điền đầy đủ thông tin!");
            return;
        }

        const cells = editingRow.querySelectorAll('td');
        cells[1].textContent = promotionName;
        cells[2].textContent = promotionDescription;
        cells[3].textContent = `${promotionDiscount}%`;
        cells[4].textContent = startDate;
        cells[5].textContent = endDate;

        alert("Cập nhật chương trình khuyến mãi thành công!");
        document.querySelector("#editPromotionModal .btn-close").click();
    });

    // Xóa chương trình khuyến mãi
    document.querySelector("#deletePromotionModal .btn-danger").addEventListener("click", function () {
        if (!deletingRow) return;

        deletingRow.remove();
        alert("Chương trình khuyến mãi đã được xóa thành công!");

        // Đóng modal và tự động ẩn backdrop
        const modal = bootstrap.Modal.getInstance(document.getElementById('deletePromotionModal'));
        modal.hide();
    });

    // Xóa trạng thái "editing-row" khi đóng modal
    document.getElementById("editPromotionModal").addEventListener("hidden.bs.modal", function () {
        const editingRow = document.querySelector(".editing-row");
        if (editingRow) {
            editingRow.classList.remove("editing-row");
        }
    });

    // Xóa trạng thái "deleting-row" khi đóng modal
    document.getElementById("deletePromotionModal").addEventListener("hidden.bs.modal", function () {
        const deletingRow = document.querySelector(".deleting-row");
        if (deletingRow) {
            deletingRow.classList.remove("deleting-row");
        }
    });
});
