<%--
  Created by IntelliJ IDEA.
  User: airm2
  Date: 15/12/2024
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên Mật Khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/admin-forgot-password.css">
</head>
<style>
    body{
        background-color: rgb(242, 242, 242);
    }
    .login-container{
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .login-box{
        background-color: #fff;
        padding: 2rem;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
</style>
<body>
<div class="container login-container">
    <div class="row w-100">
        <div class="col-lg-6 d-none d-lg-block">
            <img src="../img/pngtree-colorful-mushrooms-sticker-in-cartoon-style-vector-illustration-isolated-on-white-png-image_11380161.png" alt="Illustration" class="illustration">
        </div>
        <div class="col-lg-6" style="margin-top: 15%;">
            <div class="login-box">
                <h2 class="form-title text-black">Quên mật khẩu</h2>
                <p class="text-muted">Nhập email của bạn để nhận liên kết đặt lại mật khẩu.</p>
        <form action="../forgotPassword" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label text-black">Email</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Nhập địa chỉ email của bạn" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Gửi Yêu Cầu</button>
        </form>
                <div class="text-center mt-3">
                    <p><a href="login.jsp">Quay lại đăng nhập</a></p>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
