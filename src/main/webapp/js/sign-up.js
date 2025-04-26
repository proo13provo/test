// Script xử lý đăng ký tài khoản
document.querySelector('form').addEventListener('submit', function (event) {
    event.preventDefault(); // Ngăn form gửi dữ liệu mặc định

    // Lấy giá trị từ các trường nhập liệu
    const fullname = document.getElementById('fullname').value.trim();
    const email = document.getElementById('email').value.trim();
    const password = document.getElementById('password').value.trim();
    const confirmPassword = document.getElementById('confirm-password').value.trim();

    // Kiểm tra dữ liệu nhập
    if (!fullname || !email || !password || !confirmPassword) {
        alert('Vui lòng điền đầy đủ thông tin!');
        return;
    }

    if (password !== confirmPassword) {
        alert('Mật khẩu và xác nhận mật khẩu không khớp!');
        return;
    }

    // Lưu thông tin đăng ký vào localStorage và kiểm tra người dùng có tồn tại hay chưa
    const users = JSON.parse(localStorage.getItem('users')) || [];
    const existingUser = users.find(user => user.email === email);

    if (existingUser) {
        alert('Email đã được sử dụng! Vui lòng sử dụng email khác.');
        return;
    }

    // Thêm người dùng mới vào danh sách
    users.push({fullname, email, password});
    localStorage.setItem('users', JSON.stringify(users));

    // Hiển thị thông báo và chuyển hướng
    alert('Đăng ký thành công! Đang chuyển hướng đến trang đăng nhập...');
    window.location.href = 'login.html';
});

//Script xử lý xóa tài khoản
document.getElementById('delete-account').addEventListener('click', function () {
    const emailToDelete = prompt('Nhập email của tài khoản cần xóa:');

    if (!emailToDelete) {
        alert('Bạn chưa nhập email!');
        return;
    }

    // Lấy danh sách người dùng từ localStorage
    let users = JSON.parse(localStorage.getItem('users')) || [];

    // Kiểm tra nếu email tồn tại
    const userIndex = users.findIndex(user => user.email === emailToDelete);
    if (userIndex === -1) {
        alert('Email không tồn tại!');
        return;
    }

    // Xóa tài khoản khỏi danh sách
    users.splice(userIndex, 1);
    localStorage.setItem('users', JSON.stringify(users)); // Cập nhật localStorage
    sessionStorage.removeItem('currentUser'); // Xóa dữ liệu session nếu có

    alert('Tài khoản đã được xóa thành công!');
});