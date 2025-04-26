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
        const lastName = nameParts[nameParts.length - 1];

        const userNameBtn = document.getElementById("user-name-btn");
        if (userNameBtn) {
            userNameBtn.textContent = lastName;
        }
    }
});