<%@ page import="Models.Category.Category" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html lang="vi">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Chủ</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">


    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <link rel="stylesheet" href="css/fontawesome.css">
    <link rel="stylesheet" href="css/templatemo-space-dynamic.css">
    <link rel="stylesheet" href="css/animated.css">
    <link rel="stylesheet" href="css/owl.css">
</head>
<style>
    .product-container {
        display: flex;
        flex-wrap: nowrap;
        gap: 20px;
        padding: 20px;
        background-color: #f8f9fa;
        border: 2px solid #ddd;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .product-card {
        width: 23%;
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 8px;
        overflow: hidden;
        transition: transform 0.3s, box-shadow 0.3s;
    }

    .product-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
    }

    .product-card a {
        text-decoration: none;
        color: inherit;
    }

    .product-image {
        text-align: center;
        padding: 10px;
        background-color: #f1f1f1;
    }

    .product-image img {
        max-width: 100%;
        height: auto;
        border-radius: 5px;
    }

    .product-info {
        padding: 10px;
        text-align: center;
    }

    .product-name {
        font-size: 16px;
        font-weight: 600;
        color: #333;
        margin: 10px 0;
    }

    .product-stars {
        display: flex;
        justify-content: center;
        gap: 5px;
        margin-bottom: 10px;
    }

    .product-price {
        font-size: 14px;
        color: #555;
        font-weight: 500;
    }
    .product-card-new {
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 10px;
        overflow: hidden;
        transition: all 0.3s ease-in-out;
        display: flex;
        flex-direction: column;
        height: 100%; /* Đảm bảo chiều cao bằng nhau */
    }

    .product-card-new:hover {
        transform: translateY(-10px);
        box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
    }

    /* Hình ảnh */
    .product-image-new {
        background-color: #f8f9fa;
        padding: 15px;
        text-align: center;
    }

    .product-image-new img {
        max-width: 100%;
        height: auto;
        border-radius: 8px;
    }

    /* Phần thông tin */
    .product-info-new {
        text-align: center;
        padding: 10px;
        flex-grow: 1; /* Đảm bảo nội dung chiếm không gian linh hoạt */
        display: flex;
        flex-direction: column; /* Dùng Flexbox để căn chỉnh */
    }

    .product-name-new {
        font-size: 16px;
        font-weight: 600;
        margin: 10px 0;
        color: #333;
        min-height: 50px; /* Đặt chiều cao cố định để đồng đều */
    }

    .product-price-new {
        font-size: 14px;
        color: #007bff;
        margin-bottom: 10px;
    }

    .product-card-new .btn {
        font-size: 14px;
        padding: 5px 10px;
        border-radius: 20px;
    }
    .best-sellers p {
        font-size: 14px;
        color: #6c757d;
        line-height: 1.8;
    }
    .product-card {
        position: relative;
        width: 23%;
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 8px;
        overflow: hidden;
        transition: transform 0.3s, box-shadow 0.3s;
    }

    .product-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
    }

    .product-card .badge {
        font-size: 12px;
        padding: 5px 10px;
        border-radius: 12px;
        z-index: 10;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    }
    .product-card-new {
        position: relative;
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 10px;
        overflow: hidden;
        transition: all 0.3s ease-in-out;
        display: flex;
        flex-direction: column;
        height: 100%; /* Đảm bảo chiều cao bằng nhau */
    }

    .product-card-new:hover {
        transform: translateY(-10px);
        box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
    }

    .product-card-new .badge {
        font-size: 14px;
        padding: 5px 10px;
        border-radius: 12px;
        z-index: 10;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    }

    .product-card-new .badge.bg-warning {
        background-color: #ffc107; /* Màu vàng */
        color: #000; /* Chữ đen để tương phản tốt hơn */
    }

    .product-image-new {
        position: relative;
        background-color: #f8f9fa;
        padding: 15px;
        text-align: center;
    }

    .product-image-new img {
        max-width: 100%;
        height: auto;
        border-radius: 8px;
    }
</style>
<body>
<!-- Header -->
<%@include file="header.jsp"%>

<!-- Banner Quảng Cáo -->
<section class="banner text-white text-center py-5" style="background-color: #CD853F;">
    <div class="container">
        <h2 class="display-4">Khám Phá Những Sản Phẩm Mới Nhất!</h2>
        <p class="lead">Chọn lựa từ các loại nấm tự nhiên, tốt cho sức khỏe.</p>
    </div>
</section>

<!-- Giới Thiệu Sản Phẩm Bán Chạy -->
<section class="best-sellers py-5"  >
    <div class="container text-center">
        <h3 class="mb-4 text-uppercase text-dark">Sản Phẩm Bán Chạy</h3>
        <p class="text-muted mb-5">
            Những sản phẩm được yêu thích và bán chạy nhất trong thời gian qua. Khám phá những lựa chọn tuyệt vời
            dành riêng cho bạn!
        </p>
        <div class="row g-4">
            <div class="row g-4">
                <div class="product-container">
                    <c:forEach var="item" items="${sessionScope.topproduct.items}">
                        <div class="product-card position-relative">
                            <!-- Badge Hot -->
                            <span class="badge bg-danger position-absolute top-0 start-0 m-2 p-2 shadow" style="z-index: 10;">
                    Hot
                </span>
                            <a href="product_detail?id=${item.id}">
                                <div class="product-image">
                                    <img src="img/${item.image}" alt="${item.name}" class="img-fluid rounded">
                                </div>
                                <div class="product-info">
                                    <h4 class="product-name">${item.name}</h4>
                                    <div class="product-stars">
                                        <i class="fa-solid fa-star" style="color: #FFD43B;"></i>
                                        <i class="fa-solid fa-star" style="color: #FFD43B;"></i>
                                        <i class="fa-solid fa-star" style="color: #FFD43B;"></i>
                                        <i class="fa-solid fa-star" style="color: #FFD43B;"></i>
                                        <i class="fa-solid fa-star" style="color: #FFD43B;"></i>
                                    </div>
                                    <div class="product-price">
                                        <fmt:formatNumber value="${item.minPrice}" type="number" groupingUsed="true" /> đ -
                                        <fmt:formatNumber value="${item.maxPrice}" type="number" groupingUsed="true" /> đ
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Giới Thiệu Sản Phẩm Mới -->
<section class="new-arrivals py-5 bg-light"  >
    <div class="container text-center">
        <h3 class="mb-4 section-title text-dark">Sản Phẩm Mới</h3>
        <p class="text-muted mb-5">
            Những sản phẩm vừa cập nhật với chất lượng cao nhất, đáp ứng mọi nhu cầu của bạn. Đừng bỏ lỡ những xu
            hướng mới nhất!
        </p>
        <div class="row justify-content-center">
            <!-- Dùng JSTL để lặp qua danh sách sản phẩm mới -->
            <c:forEach var="product" items="${sessionScope.product_new.items}">
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product-card-new shadow-sm position-relative">
                        <div class="product-image-new">
                            <img src="img/${product.image}" alt="${product.name}" class="img-fluid rounded">
                            <!-- Badge NEW -->
                            <span class="badge bg-warning text-dark position-absolute top-0 start-0 m-2 p-2 shadow">
                                NEW
                            </span>
                        </div>
                        <div class="product-info-new p-3 d-flex flex-column">
                            <h5 class="product-name-new">${product.name}</h5>
                            <p class="product-price-new text-primary fw-bold mt-auto">
                                <fmt:formatNumber value="${product.minPrice}" type="number" groupingUsed="true" /> đ
                            </p>
                            <a href="product_detail?id=${product.id}" class="btn btn-outline-dark btn-sm">Chi Tiết</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- Footer -->
<%@include file="footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
