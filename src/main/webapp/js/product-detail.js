// Lấy phần tử chứa số lượng
var quantityElement = document.getElementById("quantity");

// Hàm tăng số lượng
function increaseQuantity() {
    var currentQuantity = parseInt(quantityElement.textContent);
    quantityElement.textContent = currentQuantity + 1;
}

// Hàm giảm số lượng
function decreaseQuantity() {
    var currentQuantity = parseInt(quantityElement.textContent);
    if (currentQuantity > 1) {
        quantityElement.textContent = currentQuantity - 1;
    }
}

// Lắng nghe sự kiện thay đổi trên các radio button
document.querySelectorAll('input[name="btnradio"]').forEach(radio => {
    radio.addEventListener('change', function () {
        // Đóng tất cả các collapse trước khi mở collapse mới
        var allCollapseElements = document.querySelectorAll('.collapse');
        allCollapseElements.forEach(collapse => {
            var collapseInstance = new bootstrap.Collapse(collapse, {
                toggle: false
            });
            collapseInstance.hide();
        });
    });
});