<%--
  Created by IntelliJ IDEA.
  User: airm2
  Date: 21/12/2024
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Đăng ký tài khoản</title>
  <!-- Link Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: rgb(242, 242, 242);
    }

    .register-container {
      margin-top: 50px;
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .register-box {
      background-color: #fff;
      padding: 2rem;
      border-radius: 10px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .illustration {
      max-width: 100%;
      height: auto;
    }

    .form-title {
      font-size: 1.25rem;
      font-weight: bold;
    }

    .terms {
      font-size: 0.875rem;
    }

    .social-buttons img {
      width: 40px;
      margin: 0 0.5rem;
      cursor: pointer;
    }

    .social-buttons img:hover {
      transform: scale(1.1);
      transition: transform 0.2s;
    }
  </style>
</head>
<body>
<div class="container register-container">
  <div class="row w-100">
    <!-- Hình minh họa -->
    <div class="col-lg-6 d-none d-lg-block">
      <img src="${pageContext.request.contextPath}/img/pngtree-colorful-mushrooms-sticker-in-cartoon-style-vector-illustration-isolated-on-white-png-image_11380161.png" alt="Illustration" class="illustration">
    </div>

    <!-- Form đăng ký -->
    <div class="col-lg-6">
      <div class="register-box">
        <h2 class="form-title">Đăng ký tài khoản</h2>
        <!-- Hiển thị thông báo lỗi -->
        <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
        <% if (errorMessage != null) { %>
        <div class="alert alert-danger" role="alert">
          <%= errorMessage %>
        </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/checkRegisterNha" method="POST">
          <!-- Họ và tên -->
          <div class="mb-3">
            <label for="name" class="form-label">Họ và tên</label>
            <input type="text" class="form-control" id="name" name="fullName" placeholder="Nhập họ và tên của bạn" value="<%= request.getParameter("fullName") != null ? request.getParameter("fullName") : "" %>">
          </div>

          <!-- Email -->
          <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Nhập địa chỉ email của bạn" value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>">
          </div>

          <!-- Số điện thoại -->
          <div class="mb-3">
            <label for="phone" class="form-label">Số điện thoại</label>
            <input type="text" class="form-control" id="phone" name="phoneNumber" placeholder="Nhập số điện thoại của bạn" value="<%= request.getParameter("phoneNumber") != null ? request.getParameter("phoneNumber") : "" %>">
          </div>

          <!-- Mật khẩu -->
          <div class="mb-3">
            <label for="password" class="form-label">Mật khẩu</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Tạo mật khẩu có ít nhất 6 ký tự">
          </div>

          <!-- Nhập lại mật khẩu -->
          <div class="mb-3">
            <label for="passwordre" class="form-label">Nhập lại mật khẩu</label>
            <input type="password" class="form-control" id="passwordre" name="confirmPassword" placeholder="Nhập lại mật khẩu">
          </div>

          <!-- Điều khoản -->
          <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" id="terms" name="agreeTerms">
            <label class="form-check-label terms" for="terms">
              Bạn đã đọc và đồng ý với <a href="#">Điều khoản sử dụng</a> và <a href="#">Chính sách bảo mật</a> của chúng tôi.
            </label>
          </div>

          <!-- Nút đăng ký -->
          <button type="submit" class="btn btn-dark w-100">Đăng ký</button>
        </form>
      </div>
        <!-- Hoặc đăng ký bằng -->
        <div class="text-center mt-3">
          <p>hoặc đăng ký bằng</p>
          <div class="social-buttons">
            <img src="../img/vector-blue-social-media-logo_1080184-225.jpg.avif" alt="Facebook">
            <img src="../img/Google_Icons-09-512.webp" alt="Google">
            <img src="../img/Logo-Zalo-Arc.png.webp" alt="Zalo">
            <img src="../img/yahoo-512.webp" alt="Yahoo">
          </div>
        </div>

        <!-- Đã có tài khoản -->
        <div class="text-center mt-3">
          <p>Bạn đã có tài khoản? <a href="login.jsp">Đăng nhập ngay</a></p>

        </div>
      </div>
    </div>
  </div>


<!-- Link Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>