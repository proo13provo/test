function validateEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

// Xử lý sự kiện gửi form
document.querySelector("form").addEventListener("submit", function (event) {
    event.preventDefault(); // Ngăn chặn form tự động reload trang

    // Lấy giá trị email từ input
    const emailInput = document.getElementById("email");
    const email = emailInput.value.trim();

    // Kiểm tra email hợp lệ
    if (!validateEmail(email)) {
        alert("Vui lòng nhập địa chỉ email hợp lệ!");
        emailInput.focus();
        return;
    }

    // Giả lập quá trình gửi email
    alert(`Yêu cầu lấy lại mật khẩu đã được gửi đến email: ${email}`);
    emailInput.value = "";
});