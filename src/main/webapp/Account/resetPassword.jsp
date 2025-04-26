<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt lại mật khẩu | Tên Ứng Dụng</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #4361ee;
            --primary-hover: #3a56d4;
            --success-color: #4cc9f0;
            --error-color: #f72585;
            --text-color: #2b2d42;
            --light-gray: #f8f9fa;
            --border-radius: 12px;
            --box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--light-gray);
            color: var(--text-color);
            line-height: 1.6;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
            background-image: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        }

        .reset-card {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            width: 100%;
            max-width: 480px;
            overflow: hidden;
            transition: var(--transition);
        }

        .card-header {
            background: var(--primary-color);
            color: white;
            padding: 25px;
            text-align: center;
        }

        .card-header h1 {
            font-size: 1.8rem;
            font-weight: 600;
            margin-bottom: 5px;
        }

        .card-header p {
            opacity: 0.9;
            font-size: 0.95rem;
        }

        .card-body {
            padding: 30px;
        }

        .logo {
            margin-bottom: 20px;
            text-align: center;
        }

        .logo img {
            height: 50px;
        }

        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            font-size: 0.95rem;
        }

        .input-icon {
            position: relative;
        }

        .input-icon input {
            width: 100%;
            padding: 14px 14px 14px 45px;
            border: 2px solid #e9ecef;
            border-radius: var(--border-radius);
            font-size: 1rem;
            transition: var(--transition);
        }

        .input-icon input:focus {
            border-color: var(--primary-color);
            outline: none;
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2);
        }

        .input-icon i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #adb5bd;
            font-size: 1.1rem;
        }

        .btn {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: var(--border-radius);
            background: var(--primary-color);
            color: white;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            margin-top: 10px;
        }

        .btn:hover {
            background: var(--primary-hover);
            transform: translateY(-2px);
        }

        .btn:active {
            transform: translateY(0);
        }

        .password-strength {
            margin-top: 8px;
            height: 4px;
            background: #e9ecef;
            border-radius: 2px;
            overflow: hidden;
        }

        .strength-bar {
            height: 100%;
            width: 0%;
            transition: var(--transition);
        }

        .password-requirements {
            margin-top: 15px;
            font-size: 0.85rem;
            color: #6c757d;
        }

        .password-requirements ul {
            list-style-type: none;
            padding-left: 5px;
        }

        .password-requirements li {
            margin-bottom: 5px;
            display: flex;
            align-items: center;
        }

        .password-requirements li i {
            margin-right: 8px;
            font-size: 0.7rem;
        }

        .fa-check-circle {
            color: #2ecc71;
        }

        .fa-times-circle {
            color: #e74c3c;
        }

        .alert {
            padding: 15px;
            border-radius: var(--border-radius);
            margin-bottom: 20px;
            font-size: 0.95rem;
            display: flex;
            align-items: center;
        }

        .alert i {
            margin-right: 10px;
            font-size: 1.2rem;
        }

        .alert-success {
            background-color: rgba(76, 201, 240, 0.1);
            border-left: 4px solid var(--success-color);
            color: #0a9396;
        }

        .alert-error {
            background-color: rgba(247, 37, 133, 0.1);
            border-left: 4px solid var(--error-color);
            color: var(--error-color);
        }

        .footer-text {
            text-align: center;
            margin-top: 20px;
            font-size: 0.9rem;
            color: #6c757d;
        }

        .footer-text a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
        }

        .footer-text a:hover {
            text-decoration: underline;
        }

        @media (max-width: 576px) {
            .reset-card {
                border-radius: 0;
                box-shadow: none;
            }

            body {
                padding: 0;
                background: white;
            }
        }
    </style>
</head>
<body>
<div class="reset-card">
    <div class="card-header">
        <h1>Đặt Lại Mật Khẩu</h1>
        <p>Vui lòng tạo mật khẩu mới cho tài khoản của bạn</p>
    </div>

    <div class="card-body">
        <div class="logo">
            <!-- Thay bằng logo của bạn -->
            <svg width="50" height="50" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M12 0C5.373 0 0 5.373 0 12s5.373 12 12 12 12-5.373 12-12S18.627 0 12 0zm0 22c-5.523 0-10-4.477-10-10S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10z" fill="white"/>
                <path d="M12 5c-3.866 0-7 3.134-7 7s3.134 7 7 7 7-3.134 7-7-3.134-7-7-7zm0 12c-2.761 0-5-2.239-5-5s2.239-5 5-5 5 2.239 5 5-2.239 5-5 5z" fill="white"/>
                <path d="M12 8c-2.209 0-4 1.791-4 4s1.791 4 4 4 4-1.791 4-4-1.791-4-4-4zm0 6c-1.105 0-2-.895-2-2s.895-2 2-2 2 .895 2 2-.895 2-2 2z" fill="white"/>
            </svg>
        </div>

        <%-- Hiển thị thông báo lỗi --%>
        <%
            String error = request.getParameter("error");
            if (error != null) {
        %>
        <div class="alert alert-error">
            <i class="fas fa-exclamation-circle"></i>
            <div>
                <%
                    if (error.equals("1")) {
                        out.println("Mật khẩu mới và xác nhận mật khẩu không khớp.");
                    } else if (error.equals("2")) {
                        out.println("Mã xác nhận không hợp lệ hoặc đã hết hạn. Vui lòng yêu cầu gửi lại email.");
                    } else if (error.equals("3")) {
                        out.println("Mật khẩu phải có ít nhất 8 ký tự bao gồm chữ hoa, chữ thường và số.");
                    }
                %>
            </div>
        </div>
        <% } %>

        <%-- Hiển thị thông báo thành công --%>
        <%
            String success = request.getParameter("success");
            if (success != null && success.equals("1")) {
        %>
        <div class="alert alert-success">
            <i class="fas fa-check-circle"></i>
            <div>
                Mật khẩu đã được đặt lại thành công! Bạn có thể đăng nhập bằng mật khẩu mới.
            </div>
        </div>
        <% } else { %>

        <form id="resetForm" action="${pageContext.request.contextPath}/resetPassword" method="post">
            <input type="hidden" name="token" value="<%= request.getParameter("token") != null ? request.getParameter("token") : "" %>">

            <div class="form-group">
                <label for="newPassword">Mật khẩu mới</label>
                <div class="input-icon">
                    <i class="fas fa-lock"></i>
                    <input type="password" id="newPassword" name="newPassword" placeholder="Nhập mật khẩu mới" required>
                </div>
                <div class="password-strength">
                    <div class="strength-bar" id="strengthBar"></div>
                </div>
                <div class="password-requirements">
                    <p>Mật khẩu phải đáp ứng các yêu cầu sau:</p>
                    <ul>
                        <li><i class="fas fa-check-circle" id="lengthCheck"></i> Ít nhất 8 ký tự</li>
                        <li><i class="fas fa-check-circle" id="upperCheck"></i> Chứa ít nhất 1 chữ hoa</li>
                        <li><i class="fas fa-check-circle" id="lowerCheck"></i> Chứa ít nhất 1 chữ thường</li>
                        <li><i class="fas fa-check-circle" id="numberCheck"></i> Chứa ít nhất 1 số</li>
                    </ul>
                </div>
            </div>

            <div class="form-group">
                <label for="confirmPassword">Xác nhận mật khẩu</label>
                <div class="input-icon">
                    <i class="fas fa-lock"></i>
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Nhập lại mật khẩu mới" required>
                </div>
            </div>

            <button type="submit" class="btn">
                <i class="fas fa-sync-alt" style="margin-right: 8px;"></i> Đặt Lại Mật Khẩu
            </button>
        </form>

        <div class="footer-text">
            Quay lại <a href="login.jsp">trang đăng nhập</a>
        </div>
        <% } %>
    </div>
</div>

<script>
    // Kiểm tra độ mạnh mật khẩu
    document.getElementById('newPassword').addEventListener('input', function() {
        const password = this.value;
        const strengthBar = document.getElementById('strengthBar');
        const lengthCheck = document.getElementById('lengthCheck');
        const upperCheck = document.getElementById('upperCheck');
        const lowerCheck = document.getElementById('lowerCheck');
        const numberCheck = document.getElementById('numberCheck');

        // Kiểm tra các yêu cầu
        const hasLength = password.length >= 8;
        const hasUpper = /[A-Z]/.test(password);
        const hasLower = /[a-z]/.test(password);
        const hasNumber = /[0-9]/.test(password);

        // Cập nhật icon check
        lengthCheck.className = hasLength ? 'fas fa-check-circle' : 'fas fa-times-circle';
        upperCheck.className = hasUpper ? 'fas fa-check-circle' : 'fas fa-times-circle';
        lowerCheck.className = hasLower ? 'fas fa-check-circle' : 'fas fa-times-circle';
        numberCheck.className = hasNumber ? 'fas fa-check-circle' : 'fas fa-times-circle';

        // Tính điểm độ mạnh
        let strength = 0;
        if (hasLength) strength += 1;
        if (hasUpper) strength += 1;
        if (hasLower) strength += 1;
        if (hasNumber) strength += 1;

        // Cập nhật thanh độ mạnh
        const width = strength * 25;
        strengthBar.style.width = width + '%';

        // Đổi màu thanh độ mạnh
        if (strength <= 1) {
            strengthBar.style.backgroundColor = '#ff4d4d';
        } else if (strength <= 2) {
            strengthBar.style.backgroundColor = '#ffa64d';
        } else if (strength <= 3) {
            strengthBar.style.backgroundColor = '#ffcc00';
        } else {
            strengthBar.style.backgroundColor = '#2ecc71';
        }
    });

    // Kiểm tra xác nhận mật khẩu
    document.getElementById('resetForm').addEventListener('submit', function(e) {
        const password = document.getElementById('newPassword').value;
        const confirmPassword = document.getElementById('confirmPassword').value;

        if (password !== confirmPassword) {
            e.preventDefault();
            alert('Mật khẩu xác nhận không khớp!');
            return false;
        }

        // Kiểm tra các yêu cầu mật khẩu
        const hasLength = password.length >= 8;
        const hasUpper = /[A-Z]/.test(password);
        const hasLower = /[a-z]/.test(password);
        const hasNumber = /[0-9]/.test(password);

        if (!hasLength || !hasUpper || !hasLower || !hasNumber) {
            e.preventDefault();
            alert('Mật khẩu phải đáp ứng tất cả các yêu cầu!');
            return false;
        }

        return true;
    });
</script>
</body>
</html>