let editingUserId = null;

function editUser(userId) {
    // Lưu lại ID người dùng đang chỉnh sửa
    editingUserId = userId;

    // Lấy thông tin từ bảng
    const row = document.querySelector(`tbody tr:nth-child(${userId})`);
    const nameCell = row.querySelector('td:nth-child(2)').innerText;
    const emailCell = row.querySelector('td:nth-child(3)').innerText;
    const statusCell = row.querySelector('td:nth-child(4)').innerText;

    // Đổ thông tin vào Modal
    document.getElementById('editUserName').value = nameCell;
    document.getElementById('editUserEmail').value = emailCell;
    document.getElementById('editUserStatus').value = statusCell;

    // Hiển thị Modal
    const editUserModal = new bootstrap.Modal(document.getElementById('editUserModal'));
    editUserModal.show();
}

document.getElementById('saveEditButton').addEventListener('click', () => {
    if (!editingUserId) return;

    // Lấy giá trị từ Modal
    const newName = document.getElementById('editUserName').value.trim();
    const newEmail = document.getElementById('editUserEmail').value.trim();
    const newStatus = document.getElementById('editUserStatus').value;

    // Kiểm tra dữ liệu đầu vào
    if (!newName || !newEmail) {
        alert('Vui lòng nhập đầy đủ thông tin.');
        return;
    }

    // Cập nhật bảng
    const row = document.querySelector(`tbody tr:nth-child(${editingUserId})`);
    row.querySelector('td:nth-child(2)').innerText = newName;
    row.querySelector('td:nth-child(3)').innerText = newEmail;
    row.querySelector('td:nth-child(4)').innerText = newStatus;

    // Đóng Modal
    const editUserModal = bootstrap.Modal.getInstance(document.getElementById('editUserModal'));
    editUserModal.hide();

    alert('Thông tin người dùng đã được cập nhật!');
});

function toggleStatus(userId) {
    const row = document.querySelector(`tbody tr:nth-child(${userId})`);
    const statusCell = row.querySelector('td:nth-child(4)');
    const newStatus = statusCell.innerText === 'Đang hoạt động' ? 'Bị khóa' : 'Đang hoạt động';
    statusCell.innerText = newStatus;

    console.log(`Trạng thái người dùng #${userId} đã thay đổi thành: ${newStatus}`);
}
function editUser(id, name, role, state) {
    // Điền thông tin vào các trường trong modal
    document.getElementById('editUserName').value = name;  // Đảm bảo tên được điền vào đây
    document.getElementById('editUserRole').value = role;  // Điền role
    document.getElementById('editUserStatus').value = state;  // Điền trạng thái

    // Đảm bảo ID người dùng được gửi cùng form
    const form = document.getElementById('editUserForm');
    const inputId = document.createElement('input');
    inputId.type = 'hidden';
    inputId.name = 'id';
    inputId.value = id;
    form.appendChild(inputId);
}