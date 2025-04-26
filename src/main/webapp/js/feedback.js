function loadResponse(name, email, message) {
    // Tải dữ liệu phản hồi cho khách hàng vào modal
    document.getElementById('responseMessage').value = 'Xin chào ' + name + ', cảm ơn bạn đã liên hệ với chúng tôi. Bạn hỏi về: "' + message + '"';
}

function sendResponse() {
    var responseMessage = document.getElementById('responseMessage').value;
    if (responseMessage.trim() === "") {
        alert("Vui lòng nhập phản hồi!");
        return;
    }

    // Xử lý gửi phản hồi
    alert("Phản hồi đã được gửi!");
    $('#responseModal').modal('hide');
}