<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác thực tài khoản</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #4361ee;
            --success-color: #4cc9f0;
            --error-color: #f72585;
            --dark-color: #2b2d42;
            --light-color: #f8f9fa;
            --shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #f5f7ff;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: var(--dark-color);
        }

        .message-card {
            background: white;
            border-radius: 16px;
            padding: 40px;
            width: 100%;
            max-width: 480px;
            text-align: center;
            box-shadow: var(--shadow);
            transform: translateY(0);
            animation: floatUp 0.6s ease-out;
        }

        .success-icon {
            width: 100px;
            height: 100px;
            background: linear-gradient(135deg, var(--primary-color), var(--success-color));
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto 25px;
            color: white;
            font-size: 48px;
        }

        .error-icon {
            width: 100px;
            height: 100px;
            background: linear-gradient(135deg, var(--error-color), #ff7096);
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto 25px;
            color: white;
            font-size: 48px;
        }

        h1 {
            font-size: 28px;
            margin-bottom: 15px;
        }

        .success-title {
            color: var(--primary-color);
        }

        .error-title {
            color: var(--error-color);
        }

        p {
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 30px;
            color: #666;
        }

        .countdown {
            font-size: 14px;
            color: #888;
            margin-top: 10px;
        }

        .btn {
            display: inline-block;
            padding: 12px 30px;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }

        .btn-success {
            background: var(--primary-color);
            color: white;
        }

        .btn-error {
            background: var(--error-color);
            color: white;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .btn-success:hover {
            background: #3a56d4;
            box-shadow: 0 5px 15px rgba(67, 97, 238, 0.3);
        }

        .btn-error:hover {
            background: #e5177e;
            box-shadow: 0 5px 15px rgba(247, 37, 133, 0.3);
        }

        .decoration {
            position: absolute;
            width: 200px;
            height: 200px;
            border-radius: 50%;
            background: linear-gradient(135deg, rgba(67, 97, 238, 0.1), rgba(76, 201, 240, 0.1));
            z-index: -1;
        }

        .decoration-1 {
            top: 10%;
            left: 10%;
        }

        .decoration-2 {
            bottom: 10%;
            right: 10%;
        }

        @keyframes floatUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            10%, 30%, 50%, 70%, 90% { transform: translateX(-5px); }
            20%, 40%, 60%, 80% { transform: translateX(5px); }
        }

        .shake {
            animation: shake 0.6s ease-in-out;
        }

        @media (max-width: 576px) {
            .message-card {
                padding: 30px 20px;
                margin: 0 15px;
            }

            h1 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
<div class="decoration decoration-1"></div>
<div class="decoration decoration-2"></div>

<div class="message-card">
    <%
        String status = (String) session.getAttribute("status");
        String message = (String) session.getAttribute("message");

        if ("success".equals(status)) {
            session.removeAttribute("status");
            session.removeAttribute("message");
    %>
    <div class="success-icon">
        <i class="fas fa-check"></i>
    </div>
    <h1 class="success-title">Xác thực thành công!</h1>
    <p><%= message != null ? message : "Tài khoản của bạn đã được xác thực thành công. Bạn sẽ được chuyển hướng đến trang đăng nhập sau 5 giây." %></p>
    <a href="Account/login.jsp" class="btn btn-success">Đăng nhập ngay</a>
    <div class="countdown">Tự động chuyển hướng sau: <span id="countdown">5</span> giây</div>

    <script>
        // Đếm ngược và chuyển hướng
        let seconds = 5;
        const countdownElement = document.getElementById('countdown');
        const countdownInterval = setInterval(() => {
            seconds--;
            countdownElement.textContent = seconds;

            if (seconds <= 0) {
                clearInterval(countdownInterval);
                window.location.href = 'Account/login.jsp';
            }
        }, 1000);
    </script>
    <% } else {
        // Hiển thị thông báo lỗi
    %>
    <div class="error-icon shake">
        <i class="fas fa-times"></i>
    </div>
    <h1 class="error-title">Xác thực thất bại</h1>
    <p><%= message != null ? message : "Đã xảy ra lỗi trong quá trình xác thực tài khoản. Vui lòng thử lại sau." %></p>
    <a href="Account/login.jsp" class="btn btn-error">Quay lại trang đăng nhập</a>
    <% } %>
</div>
</body>
</html>