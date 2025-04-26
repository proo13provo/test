<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chọn Hình Thức Giao Hàng</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .form-container {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .image-container {
            background-size: cover;
            background-position: center;
            height: 100%;
            border-radius: 10px 0 0 10px;
        }
        .row-container {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .btn-expand {
            transition: width 0.3s ease-in-out, background-color 0.3s;
            width: 100%;
            padding: 12px;
            font-size: 18px;
        }
        .btn-expand:hover {
            width: 120%;
            background-color: #1178e6;
        }
        .alert-custom {
            background-color: #e9ecef;
            border-left: 4px solid #f47b12;
            margin-top: 20px;
        }
        .card {
            border-radius: 10px;
        }
        .card-header {
            background-color: #fc611f;
            color: white;
            text-align: center;
            font-weight: bold;
        }
        .card-body {
            background-color: #f1f1f1;
            padding: 20px;
            border-radius: 10px;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="row row-container">
        <!-- Cột hình ảnh -->
        <div class="col-md-6 image-container">
            <img src="${pageContext.request.contextPath}/img/chi-phi-logistics-7292.png" alt="" class="img-fluid">
        </div>

        <!-- Cột form chọn dịch vụ -->
        <div class="col-md-6 form-container">
            <div class="card">
                <div class="card-header">
                    Thêm Hình Thức Giao Hàng
                </div>
                <div class="card-body">
                    <!-- Hiển thị thông báo thành công hoặc lỗi -->
                    <c:if test="${not empty successMessage}">
                        <div class="alert alert-success">${successMessage}</div>
                    </c:if>

                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger">${errorMessage}</div>
                    </c:if>

                    <form action="../admin/addShipping" method="POST">
                        <div class="mb-3">
                            <label for="deliveryService" class="form-label">Chọn Dịch Vụ Giao Hàng</label>
                            <select class="form-select" id="deliveryService" aria-label="Chọn dịch vụ" name="deliveryService">
                                <option selected>Chọn dịch vụ</option>
                                <option value="Vận Chuyển Nhanh">Vận Chuyển Nhanh</option>
                                <option value="Hoả Tốc">Hoả Tốc</option>
                                <option value="Tiết Kiệm">Tiết Kiệm</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="price" class="form-label">Giá Tiền (VNĐ)</label>
                            <input type="number" class="form-control" id="price" placeholder="Nhập giá tiền" name="price">
                        </div>

                        <button type="submit" class="btn btn-primary w-100 btn-expand">Xác Nhận</button>
                    </form>
                </div>
            </div>

            <!-- Thêm thông báo -->
            <div class="alert alert-custom mt-4">
                <strong>Lưu ý!</strong> Thêm các dịch vụ giao hàng.
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>