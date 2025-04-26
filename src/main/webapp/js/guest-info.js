// Lấy thông tin người dùng để làm giá trị mặc định cho Modal Thay đổi thông tin người dùng
function loadProfileIntoModal() {
    // Lấy thông tin từ các phần tử hiển thị thông tin cá nhân
    const name = document.getElementById('user-name').innerText;
    const email = document.getElementById('user-email').innerText;
    const phone = document.getElementById('user-phone').innerText;
    const birthdate = document.getElementById('user-birthdate').innerText; // Định dạng dd/mm/yyyy
    const company = document.getElementById('user-company').innerText;
    const address = document.getElementById('user-address').innerText;

    // Chuyển birthdate từ dd/mm/yyyy sang yyyy-mm-dd để điền vào input
    const birthdateParts = birthdate.split('/');
    const formattedBirthdate = `${birthdateParts[2]}-${birthdateParts[1]}-${birthdateParts[0]}`;

    // Gán giá trị vào các trường trong Modal
    document.getElementById('editName').value = name;
    document.getElementById('editEmail').value = email;
    document.getElementById('editPhone').value = phone;
    document.getElementById('editBirthdate').value = formattedBirthdate;
    document.getElementById('editCompany').value = company;
    document.getElementById('editAddress').value = address;
}


// Thay đổi thông tin người dùng
function changeProfile() {
    const name = document.getElementById('editName').value;
    const email = document.getElementById('editEmail').value;
    const phone = document.getElementById('editPhone').value;
    const birthdate = document.getElementById('editBirthdate').value;
    const company = document.getElementById('editCompany').value;
    const address = document.getElementById('editAddress').value;

    document.getElementById('user-name').innerText = name;
    document.getElementById('user-email').innerText = email;
    document.getElementById('user-phone').innerText = phone;
    document.getElementById('user-birthdate').innerText = new Date(birthdate).toLocaleDateString('vi-VN');
    document.getElementById('user-company').innerText = company;
    document.getElementById('user-address').innerText = address;

    const modal = bootstrap.Modal.getInstance(document.getElementById('editProfileModal'));
    modal.hide();
}

// Thay đổi mật khẩu
function changePassword() {
    const email = sessionStorage.getItem("loggedInUser"); // Lấy email của người dùng đã đăng nhập
    const oldPassword = document.getElementById('oldPassword').value;
    const newPassword = document.getElementById('newPassword').value;
    const confirmPassword = document.getElementById('confirmPassword').value;

    if (!email) {
        alert('Không tìm thấy người dùng đang đăng nhập!');
        return;
    }

    // Lấy danh sách người dùng từ localStorage
    const users = JSON.parse(localStorage.getItem('users')) || [];

    const user = users.find(user => user.email === email);

    if (!user) {
        alert('Người dùng không tồn tại!');
        return;
    }

    if (user.password !== oldPassword) {
        alert('Mật khẩu cũ không chính xác!');
        return;
    }

    if (newPassword !== confirmPassword) {
        alert('Mật khẩu mới và xác nhận không khớp!');
        return;
    }

    // Cập nhật mật khẩu
    user.password = newPassword;

    // Lưu lại danh sách người dùng với mật khẩu đã thay đổi vào localStorage
    localStorage.setItem('users', JSON.stringify(users));
    alert('Mật khẩu đã được thay đổi thành công!');

    // Đóng modal
    const modal = bootstrap.Modal.getInstance(document.getElementById('changePasswordModal'));
    modal.hide();
}

// Chuyển hướng người dùng
function redirectToGuestInfo() {
    const loggedInUser = sessionStorage.getItem("loggedInUser");

    if (!loggedInUser) {
        const isGuest = confirm("Bạn chưa đăng nhập. Bạn có muốn đăng nhập không?");
        if (isGuest) {
            window.location.href = "login.html";
        } else {
            alert("Vui lòng đăng nhập để truy cập.");
        }
    } else if (loggedInUser === "19130083@st.hcmuaf.edu.vn") {
        window.location.href = "guest-info.html";
    } else {
        alert("Bạn không có quyền truy cập trang này.");
    }
}

// Hiển thị tên người dùng hiện tại
document.addEventListener("DOMContentLoaded", function () {
    // Lấy fullname từ sessionStorage
    const loggedInUserFullname = sessionStorage.getItem("loggedInUserFullname");

    if (loggedInUserFullname) {
        // Tách phần tên cuối
        const nameParts = loggedInUserFullname.trim().split(" ");
        const lastName = nameParts[nameParts.length - 1]; // Phần tên cuối cùng

        // Cập nhật nội dung nút btn-warning
        const userNameBtn = document.getElementById("user-name-btn");
        if (userNameBtn) {
            userNameBtn.textContent = lastName;
        }
    }
});