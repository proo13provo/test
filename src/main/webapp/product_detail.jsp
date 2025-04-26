<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="Models.Products.Products" %>
<%@ page import="Models.Feedback.Feedback" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: airm2
  Date: 16/12/2024
  Time: 20:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chi Tiết Sản Phẩm</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<style>
    .row-item:hover {
        background-color: #f5f5f5;
        transform: scale(1.02); /* Phóng to nhẹ */
        transition: all 0.3s ease-in-out; /* Hiệu ứng mượt */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Thêm bóng */
    }

    .row-item .badge {
        transition: background-color 0.3s ease-in-out;
    }

    /* Hiệu ứng badge khi di chuột */
    .row-item:hover .badge {
        background-color: #ff9800; /* Đổi màu */
    }
    .zoomable:hover {
        transform: scale(1.2);
    }

    /* Căn chỉnh ảnh nhỏ */
    .thumbnail {
        width: 120px;
        cursor: pointer;
        transition: transform 0.2s ease;
    }

    /* Hiệu ứng phóng to nhẹ khi hover ảnh nhỏ */
    .thumbnail:hover {
        transform: scale(1.1);
    }
    .image-container {
        position: relative;
        width: 450px;
        height: auto;
    }

    /* Ảnh chính */
    .zoomable {
        width: 100%;
        display: block;
    }

    navbar {
        background-color: #f4e3ca;
        transition: all 0.4s ease-in-out;
        padding: 10px 0;
    }

    /* Navbar khi cuộn trang */
    .navbar-scrolled {
        background-color: rgba(247, 225, 195, 0.9);
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    /* Logo */
    .navbar-brand {
        font-weight: bold;
        color: #6b3e2e;
        transition: all 0.3s;
    }

    .navbar-brand:hover {
        color: #a34d2f;
    }

    /* Menu link */
    .navbar-nav .nav-link {
        color: #333;
        font-weight: 500;
        position: relative;
        transition: all 0.3s;
    }

    .navbar-nav .nav-link:hover {
        color: #a34d2f;
    }

    /* Hiệu ứng gạch dưới khi hover */
    .navbar-nav .nav-link::after {
        content: "";
        display: block;
        width: 0;
        height: 2px;
        background: #a34d2f;
        transition: width 0.3s;
    }

    .navbar-nav .nav-link:hover::after {
        width: 100%;
    }

    .border-dashed {
        border-style: dashed !important;
    }
    body {
        background-color: #f8f9fa;
    }
    .product-img:hover {
        transform: scale(1.1);
        transition: 0.3s ease-in-out;
    }
    .card:hover {
        box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
        transition: 0.3s;
    }
    .btn-primary {
        background-color: #a0522d;
        border-color: #a0522d;
    }
    .btn-primary:hover {
        background-color: #8b4513;
        border-color: #8b4513;
    }
    footer {

        color: #ddd;
        font-family: 'Poppins', sans-serif;
    }

    footer h5 {
        color: #f46f1c;
        font-weight: bold;
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    footer a {
        color: #bbb;
        transition: color 0.3s ease, transform 0.3s ease;
    }

    footer a:hover {
        color: #f8c471;
        transform: translateX(3px);
    }

    footer .social-icons a {
        display: inline-block;
        transition: transform 0.3s ease, filter 0.3s ease;
    }

    footer .social-icons a:hover {
        transform: scale(1.1);
        filter: brightness(1.2);
    }

    footer hr {
        border-top: 1px solid rgba(255, 255, 255, 0.2);
    }

    footer .payments {
        filter: brightness(0.8);
        transition: filter 0.3s ease;
    }

    footer .payments:hover {
        filter: brightness(1);
    }
    .social-icons {
        position: fixed;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
        z-index: 1000;
    }
    .social-icons a {
        display: block;
        margin-bottom: 10px;
        padding: 10px;
        color: white;
        text-align: center;
        width: 40px;
        border-radius: 5px;
    }
    .nav-tabs .nav-link {
        color: black;
        transition: color 0.3s ease-in-out, background-color 0.3s;
    }
    .nav-tabs .nav-link:hover {
        color: #e31919;
    }
    .nav-tabs .nav-link.active {
        color: white;
        background-color: #B0501D;
        border-radius: 5px;
    }

    /* Bảng hiển thị thông tin */
    .table-bordered {
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0px 3px 10px rgba(0, 0, 0, 0.1);
    }

    /* Hiệu ứng mượt mà khi chuyển tab */
    .tab-pane {
        opacity: 0;
        transform: translateY(10px);
        transition: opacity 0.5s ease, transform 0.5s ease;
    }
    .tab-pane.show {
        opacity: 1;
        transform: translateY(0);
    }
    .product-card {
        position: relative;
        overflow: hidden;
        height: 450px;
        margin-top: 15px;

    }

    /* css san pham*/
    .product-image {
        position: relative;
        width: 100%;
        height: 300px; /* Đặt chiều cao cố định cho container */

    }

    .main-image, .hover-image {
        width: 100%;
        height: 100%;
        object-fit: cover; /* Đảm bảo hình ảnh không bị méo */
        position: absolute;
        top: 0;
        left: 0;
        transition: opacity 0.5s ease-in-out;

    }
    .hover-image {
        position: absolute;
        top: 0;
        left: 0;
        opacity: 0;

    }

    .product-image:hover .hover-image {
        opacity: 1;
    }

    .product-image:hover .main-image {
        opacity: 0;
    }
    .category-button {
        transition: transform 0.2s ease, color 0.2s ease;
    }

    .category-button img {
        transition: transform 0.2s ease;
    }

    /* Hiệu ứng hover */
    .category-button:hover {
        color: #ff5733; /* Màu chữ khi di chuột vào */
    }

    .category-button:hover img {
        transform: scale(1.1); /* Phóng to ảnh nhẹ */
    }

    /* Hiệu ứng khi nút được chọn */
    .category-button.active {
        color: rgb(249, 44, 2);
        background-color: #ff5733; /* Nền cam */
        border-radius: 8px;
        padding: 5px 10px;
    }
    .star-rating i {
        color: gold;
        font-size: 20px;
    }

    .product-icons {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        display: flex;
        gap: 10px;
        opacity: 0;
        transition: opacity 0.3s ease, transform 0.3s ease;
        pointer-events: none; /* Đảm bảo không bị cản trở */
    }
    .product-image:hover .product-icons {
        opacity: 1;
        transform: translate(-50%, -40%);
        pointer-events: auto; /* Bật lại khi hover */
    }
    .product-icons i {
        background: white;
        padding: 10px;
        border-radius: 50%;
        font-size: 18px;
        color: #333;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        cursor: pointer;
        transition: background 0.3s ease, transform 0.3s ease;
    }

    .product-icons i:hover {
        background: #f8b400;
        color: white;
        transform: scale(1.1);
    }

    .product-image:hover .product-icons {
        opacity: 1;
        transform: translate(-50%, -40%);
    }
    .product-options {
        margin-top: 10px;
    }

    .product-options label {
        display: inline-block;
        padding: 5px 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        cursor: pointer;
        margin: 5px;
        transition: all 0.3s ease;
    }

    .product-options input {
        display: none; /* Ẩn radio mặc định */
    }

    .product-options label:hover,
    .product-options input:checked + label {
        background-color: #f8b400;
        color: white;
        border-color: #f8b400;
    }
    .section-title {
        color: #c44d2d;
        font-weight: bold;
    }
    .feature-item {
        display: flex;
        align-items: center;
        gap: 15px;
        margin-bottom: 20px;
    }
    .feature-item i {
        font-size: 24px;
        color: #000;
    }
    /* end css sp*/
    .icon {
        filter: grayscale(100%); /* Mặc định là xám */
        transition: filter 0.3s ease-in-out;
    }

    .icon:hover {
        filter: grayscale(0%); /* Khi hover sẽ trở về màu gốc */
    }

    .navbar {
        background-color: #f4dab3;
        transition: all 0.4s ease-in-out;
        padding: 10px 0;
        margin-bottom: 50px;
    }

    /* Navbar khi cuộn trang */
    .navbar-scrolled {
        background-color: rgba(247, 225, 195, 0.9);
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    /* Logo */
    .navbar-brand {
        font-weight: bold;
        color: #6b3e2e;
        transition: all 0.3s;
    }

    .navbar-brand:hover {
        color: #a34d2f;
    }

    /* Menu link */
    .navbar-nav .nav-link {
        color: #333;
        font-weight: 500;
        position: relative;
        transition: all 0.3s;
    }

    .navbar-nav .nav-link:hover {
        color: #a34d2f;
    }

    /* Hiệu ứng gạch dưới khi hover */
    .navbar-nav .nav-link::after {
        content: "";
        display: block;
        width: 0;
        height: 2px;
        background: #a34d2f;
        transition: width 0.3s;
    }

    .navbar-nav .nav-link:hover::after {
        width: 100%;
    }

    /* Dropdown */
    .dropdown-menu {
        background-color: #fdf3e5;
        border-radius: 5px;
        animation: fadeIn 0.3s ease-in-out;
    }

    .dropdown-item {
        transition: background-color 0.3s ease-in-out;
    }

    .dropdown-item:hover {
        background-color: #e8c6a7;
    }

    /* Giỏ hàng */
    .cart-icon {
        position: relative;
        font-size: 1.2rem;
        transition: transform 0.3s;
    }

    .cart-icon:hover {
        transform: scale(1.1);
    }

    .cart-badge {
        position: absolute;
        top: -5px;
        right: -10px;
        background: red;
        color: white;
        font-size: 12px;
        padding: 3px 6px;
        border-radius: 50%;
    }

    /* Nút tìm kiếm và user */
    .search-icon, .user-icon {
        font-size: 1.2rem;
        transition: transform 0.3s;
    }

    .search-icon:hover, .user-icon:hover {
        transform: scale(1.2);
    }

    /* Hiệu ứng fade-in */
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-10px); }
        to { opacity: 1; transform: translateY(0); }
    }
    .category-title {
        text-align: center;

        color: #e18456;
    }

    .rating-bar {
        height: 10px;
        background-color: #eee;
        border-radius: 5px;
        overflow: hidden;
    }
    .rating-fill {
        height: 100%;
        background-color: #f90;
    }
    .star {
        color: #f90;
    }
    .rating-text {
        font-size: 14px;
    }
    .review-container {
        max-width: 700px;
        margin: 30px auto;
    }
    .review-item {
        background: #fff;
        padding: 15px;
        border-radius: 10px;
        box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
        margin-bottom: 15px;
    }
    .review-name {
        font-weight: bold;
        color: #333;
        font-size: 16px;
    }
    .verified-badge {
        color: #28a745;
        font-size: 14px;
    }
    .text-warning i {
        color: #ffc107;
    }
    .review-text {
        font-size: 15px;
        color: #555;
    }
    .review-actions {
        display: flex;
        align-items: center;
        font-size: 14px;
        color: #777;
    }
    .review-actions i {
        cursor: pointer;
        margin-right: 5px;
    }
    .review-actions a {
        text-decoration: none;
        color: #007bff;
        margin-left: 10px;
    }
    .review-actions span {
        margin-left: auto;
    }
    .delivery-container {
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 30px;
    }
    .delivery-text {
        max-width: 600px;
    }
    .delivery-text h5 {
        font-weight: bold;
    }
    .delivery-text ul {
        padding-left: 20px;
    }
    .content-section {
        padding: 50px 0;
    }
    .image-container img {
        border-radius: 10px;
        width: 100%;
        height: auto;
    }
    .category-item {
        cursor: pointer;
        transition: background-color 0.3s ease, font-weight 0.3s ease, box-shadow 0.3s ease, transform 0.2s ease;
        border-bottom: 1px dashed rgb(238, 48, 48);

    }
    .category-item:hover {
        box-shadow: 0 4px 8px rgba(232, 33, 33, 0.2);
        transform: translateY(-2px);
        background:linear-gradient(90deg, #ebee95, #f29a5c);
        border-radius: 10px;
    }
    .category-item.selected {
        background-color: #dee2e6;
        font-weight: bold;
    }


    .btn-outline-dark {
        position: relative;
        overflow: hidden;
        transition: all 0.5s ease-in-out;
    }

    .btn-outline-dark:hover {
        background: linear-gradient(45deg, #ffe6d5, #f07025);
        color: #fff;
        box-shadow: 0 0 15px rgba(237, 19, 4, 0.6);
        transform: translateY(-2px); /* Nhẹ nhàng hơn thay vì scale */
    }

    .btn-outline-dark::before {
        content: "";
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: rgba(255, 255, 255, 0.2);
        transition: left 0.5s ease-in-out;
    }

    .btn-outline-dark:hover::before {
        left: 100%;
    }
    .review-images {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
        margin: 10px 0;
    }

    .review-thumbnail {
        width: 80px;
        height: 80px;
        object-fit: cover;
        border-radius: 4px;
        cursor: pointer;
        transition: transform 0.2s;
    }

    .review-thumbnail:hover {
        transform: scale(1.05);
    }

    .more-images {
        width: 80px;
        height: 80px;
        background: #f5f5f5;
        border-radius: 4px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
        color: #666;
        cursor: pointer;
    }
</style>
<body>
<%@include file="header.jsp"%>
<section class="content1">
    <div class="container">
        <div class="row">
            <div class="col-5 ps-5">
                <ul class="nav">
                    <li class="nav_item mt-4">
                        <div class="d-flex justify-content-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a class="text-secondary" href="#">Trang Chủ</a></li>
                                    <li class="breadcrumb-item"><a class="text-secondary" href="#">Sản Phẩm</a></li>
                                    <li class="breadcrumb-item" aria-current="page">Data</li>
                                </ol>
                            </nav>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <%
        Products pro = (Products) session.getAttribute("product_detail");
        if(pro == null){
            pro  = new Products();
            session.setAttribute("product_detail",pro);
        }
        System.out.println(pro.items.size());
    %>
        <c:forEach var="item" items="${sessionScope.product_detail.items}" >
        <div class="row">
            <div class="col-5 pe-0">
                <div class="d-flex justify-content-center">
                    <ul class="nav">
                        <li class="nav-item mt-3">
                            <div class="d-inline-block">
                                <div class="ms-4"><img src="img/${item.image1}" style="width: 450px" class="" alt="..."></div>
                                <div class="">
                                    <ul class="nav">
                                        <li class=""><a href=""><img src="img/${item.image1}" style="width: 120px" class="" alt="..."></a></li>

                                        <li class=""><a href=""><img src="img/${item.image2}" style="width: 120px" class="" alt="..."></a></li>
                                        <li class=""><a href=""><img src="img/${item.image3}" style="width: 120px" class="" alt="..."></a></li>
                                        <li class=""><a href=""><img src="img/${item.image4}" style="width: 120px" class="" alt="..."></a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="col-4 ps-0 chitiet">



                 <div class="text-danger fw-medium d-flex mt-1 fs-2" id="sp">
                         ${item.name}
                </div>
                <div class="mt-3">
                    <ul class="nav">
                        <li class="nav_item">5.0</li>
                        <li class=""><div class="ms-2"><i class="fa-solid fa-star" style="color: #FFD43B;"></i></div></li>
                        <li class=""><div class=""><i class="fa-solid fa-star" style="color: #FFD43B;"></i></div></li>
                        <li class=""><div class=""><i class="fa-solid fa-star" style="color: #FFD43B;"></i></div></li>
                        <li class=""><div class=""><i class="fa-solid fa-star" style="color: #FFD43B;"></i></div></li>
                        <li class=""><div class=""><i class="fa-solid fa-star" style="color: #FFD43B;"></i></div></li>
                        <li class="ms-2 text-secondary">(18 đánh giá)</li>
                        <li class="ms-2 text-secondary" style="--bs-text-opacity: .30;">|</li>
                        <li class="ms-2 text-secondary">Đã bán 375</li>
                    </ul>
                </div>
                <div class="mt-2">
                    <div class="d-flex fw-bold text-danger fs-4"><fmt:formatNumber value="${item.minPrice}" type="number" groupingUsed="true" /> đ - <fmt:formatNumber value="${item.maxPrice}" type="number" groupingUsed="true" /> đ</div>
                </div>
                <div class="border border-warning rounded-3 border-3 mt-3" style="border-color: rgb(193 101 44) !important">
                    <div class="border rounded" style="background-color: #B0501D; border-width: 6px">
                        <div class="text-light fw-bold ms-3 pt-2"  style="height:40px">THÔNG TIN SẢN PHẨM - <span id="masanpham">NX${item.id}</span> </div>
                    </div>
                    <div class="container">
                        <ul class="nav">
                            <li class="nav_item fw-bold mt-2" style="font-size: smaller">${item.name}: </li>
                            <li class="nav_item mt-2" style="font-size: smaller">${item.description}</li>
<%--                            <li class="nav_item" style="font-size: smaller">ngon ngọt với vị Umami tự nhiên như thịt, thanh đạm, tốt cho sức khỏe, chế biến được nhiều món ăn ngon. Là một trong các loại nấm có hoạt chất giúp cơ thể ngừa ung thư hiệu quả.</li>--%>
                        </ul>
                        <ul class="nav">
                            <li class="nav_item fw-bold mt-2" style="font-size: smaller">Giao hàng:</li>
                            <li class="nav_item mt-2" style="font-size: smaller">Nội thành của Thành phố HCM</li>
                        </ul>
                        <ul class="nav">
                            <li class="nav_item fw-bold mt-2" style="font-size: smaller">Xuất xứ: </li>
                            <li class="nav_item mt-2" style="font-size: smaller">Nông Trại Nấm Xanh Việt Nam</li>
                        </ul>
                        <ul class="nav">
                            <li class="nav_item fw-bold mt-2" style="font-size: smaller">NSX: </li>
                            <li class="nav_item mt-2" style="font-size: smaller">Từ farm về nấm mới mỗi ngày</li>
                        </ul>
                        <ul class="nav">
                            <li class="nav_item fw-bold mt-2" style="font-size: smaller">HSD: </li>
                            <li class="nav_item mt-2" style="font-size: smaller">5-7 ngày (từ ngày sản xuất)</li>
                        </ul>
                        <ul class="nav">
                            <li class="nav_item fw-bold mt-2" style="font-size: smaller">Khách lẻ đặt nhanh qua SĐT/Zalo:</li>
                            <li class="nav_item mt-2" style="font-size: smaller">027 637 5467</li>
                        </ul>
                        <ul class="nav">
                            <li class="nav_item fw-bold mt-2" style="font-size: smaller">Quý Doanh Nghiệp liên hệ SĐT/Zalo:</li>
                            <li class="nav_item mt-2" style="font-size: smaller">027 348 4589 (MR T)</li>
                        </ul>
                    </div>
                </div>
                <div class="border rounded mt-3 d-flex justify-content-center" style="background-color: #B0501D">
                    <div class="text-light fw-bold ms-3 pt-1"  style="height:30px">SẢN PHẨM GỢI Ý</div>
                </div>
                <form action="product_de?productID=&weight=&quantity=" method="get">
                    <!-- Thêm trường ẩn để lưu id sản phẩm -->
                    <input type="hidden" name="productID" value="${item.id}"> <!-- Thay 1 bằng id sản phẩm thực tế -->

                    <!-- Thêm trường ẩn để lưu quy cách (weight) -->
                    <input type="hidden" name="weight" id="selectedWeight" value="200"> <!-- Mặc định là 200gr -->
                    <input type="hidden" name="quantity" id="quantity" value="1">

                    <div class="container d-flex justify-content-center">
                        <div class="border rounded bg-secondary-subtle mt-2 border pt-1" style="width: 220px;height: 35px">
                            <a class="nav-link fw-bold d-flex justify-content-center" href="#">${item.name}</a>
                        </div>
                    </div>
                    <div class="border mt-3"></div>
                    <div class="border rounded mt-4 d-flex justify-content-start" style="background-color: #B0501D">
                        <div class="text-light fw-medium ms-3 pt-2" style="height:40px"><i class="fa-regular fa-gem"></i> Tích 39-165 NAXA khi mua sản phẩm này</div>
                    </div>
                    <div class="fw-medium mt-4">Quy Cách:
                        <input type="radio" class="btn-check" data-bs-toggle="collapse" data-bs-target="#collapseExample1" aria-controls="collapseExample1" name="btnradio" id="btnradio1" onclick="updateWeight('200')">
                        <label class="btn btn-outline-dark pt-0 ps-1 ms-3" style="height: 25px; width: 50px" for="btnradio1">200gr</label>
                        <input type="radio" class="btn-check" data-bs-toggle="collapse" data-bs-target="#collapseExample2" aria-controls="collapseExample2" name="btnradio" id="btnradio2" onclick="updateWeight('500')">
                        <label class="btn btn-outline-dark pt-0 ps-1 ms-2" style="height: 25px; width: 50px" for="btnradio2">500gr</label>
                        <input type="radio" class="btn-check" data-bs-toggle="collapse" data-bs-target="#collapseExample3" aria-controls="collapseExample3" name="btnradio" id="btnradio3" onclick="updateWeight('1000')">
                        <label class="btn btn-outline-dark pt-0 ps-1 ms-2" style="height: 25px; width: 50px" for="btnradio3">1kg</label>

                        <div class="collapse" id="collapseExample1">
                            <div class="mt-4 text-danger fw-bold"><fmt:formatNumber value="${item.minPrice}" type="number" groupingUsed="true" /> đ</div>
                        </div>
                        <div class="collapse" id="collapseExample2">
                            <div class="mt-4 text-danger fw-bold">65.000đ</div>
                        </div>
                        <div class="collapse" id="collapseExample3">
                            <div class="mt-4 text-danger fw-bold"><fmt:formatNumber value="${item.maxPrice}" type="number" groupingUsed="true" /> đ</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-2 mt-4">
                            <div class="btn-group" role="group" aria-label="Basic outlined example">
                                <button type="button" class="btn btn-outline-secondary text-dark d-flex justify-content-center" style="width: 20px" onclick="updateQuantity(-1)">-</button>
                                <a class="btn btn-outline-secondary text-dark d-flex justify-content-center" id="displayQuantity" style="width: 20px">1</a>
                                <button type="button" class="btn btn-outline-secondary text-dark d-flex justify-content-center" style="width: 20px" onclick="updateQuantity(1)">+</button>
                            </div>
                        </div>
                        <div class="col-6 ms-3 border rounded mt-4" style="background-color: #B0501D; height: 40px;padding: 0;border-radius: 5px">
                            <button type="submit" class="text-light fw-medium d-flex pt-2 d-flex justify-content-center btn-add-to-cart" style="cursor: pointer;color: white;background-color: #B0501D; width: 100%;margin: 0 ;border: none">THÊM VÀO GIỎ HÀNG</button>
                        </div>
                        <div class="col-3 ms-1 border rounded mt-4" style="background-color: #B0501D; height: 40px">
                            <div class="text-light fw-medium pt-2 d-flex justify-content-center">
                                <a href="javascript:void(0);" onclick="submitFormNow()" style="text-decoration: none; color: white; cursor: pointer;">MUA NGAY</a>
                            </div>
                        </div>
                    </div>
                </form>
                <div>
                <ul class="nav mt-2">
                    <li class="nav-item mt-0">
                        <button type="button" class="btn"><i class="fa-regular fa-heart"></i></button>
                    </li>
                    <a href="addWishlist?productID=${item.id}" style="text-decoration: none;color: black"><li class="nav_item fw-bold mt-1">Thêm yêu thích</li></a>
                </ul>
            </div>
            </div>
                </c:forEach>


            <div class="col-3 pe-0">
                <div class="">
                    <ul class="nav">
                        <li class="nav_item mt-4 d-inline-block border border-danger-subtle border-3 rounded">
                            <div class="text-secondary fw-bold mt-1" style="font-size: smaller">NẤM đạt các kiểm nghiệm an toàn</div>
                            <div class="text-secondary fw-bold mt-1" style="font-size: smaller">Chứng nhận VSATTP Farm & CSSX</div>
                            <div class="text-secondary fw-bold mt-1" style="font-size: smaller">Hỗ trợ đổi/trả nhanh chóng 24h</div>
                            <div class="text-secondary fw-bold mt-1" style="font-size: smaller">Ưu tiên chất lượng NẤM Loại 1</div>
                            <div class="text-secondary fw-bold mt-1" style="font-size: smaller">Giao hàng TP.HCM & Toàn Quốc</div>
                            <div class="text-secondary fw-bold mt-1" style="font-size: smaller">Đa dạng hình thức thanh toán</div>
                        </li>
                    </ul>
                    <div class="d-flex mt-3 text-danger fw-bold fs-5">
                        MENU SẢN PHẨM
                    </div>
                    <div class="d-flex mt-2">
                        <div class="container">
                            <div class="vstack gap-3">
                                <div class="row" >
                                    <c:forEach var="item" items="${sessionScope.categories.items}">
                                        <!-- Tạo một hàng cho mỗi mục -->

                                        <ul class="row align-items-center row-item p-2 rounded" style="list-style: none;margin-bottom: 0">
                                            <!-- Cột bên trái hiển thị tên danh mục -->
                                            <div class="col text-secondary fw-medium">
                                                <a href="product_category?idCategory=${item.id}" style="text-decoration: none;color: black"><li style="cursor: pointer" >${item.name}</li></a>
                                            </div>
                                            <!-- Cột bên phải hiển thị giá trị tương ứng -->
                                            <div class="col-4 fs-6">
                                                <div class="badge border text-bg-light">${item.quantity}</div>
                                            </div>
                                        </ul>
                                    </c:forEach>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="border mt-4"></div>
                    <div class="fw-bold text-danger fs-5 mt-4">TÌM KIẾM SẢN PHẨM</div>
                    <div class="border border-1 rounded mt-3">
                        <ul class="nav">
                            <li class="w-75"><input type="text" class="form-control" placeholder="Tìm kiếm sản phẩm" aria-label="Tìm kiếm sản phẩm"></li>
                            <li class="w-25 d-flex justify-content-center"><button type="button" class="btn "><i class="fa-solid fa-magnifying-glass"></i></button></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section>
    <div class="row">
        <div class="border border-1 mt-3"></div>
    </div>
    <div class="row mt-4 mb-5">
        <div class="col d-flex justify-content-center">
            <ul class="nav">
                <li class="nav_item">
                    <div class="">

                    </div>
                </li>

            </ul>
        </div>
    </div>
    <div class="container mt-4">
        <!-- Tabs -->
        <ul class="nav nav-tabs" id="productTabs" >
            <li class="nav-item">
                <a class="nav-link active" data-bs-toggle="tab" href="#mo-ta">Mô tả</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#danh-gia">Đánh giá (14)</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#van-chuyen">Vận chuyển</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#ve-nam-xanh">Về Nấm Xanh</a>
            </li>
        </ul>
    <div class="tab-content mt-3">
        <!-- Tab Mô Tả -->
        <div class="tab-pane fade show active" id="mo-ta">
            <div class="container mt-5" id="des0">
                <h5 class="fw-bold" style="color: #B0501D;">Thông tin Nấm Đùi Gà Tươi</h5>
                <p>Nấm Đùi Gà Tươi là nấm ăn thông dụng với vị ngon ngọt bùi, phần thịt nấm săn chắc nên ăn rất thú vị. Loại nấm này có thể dùng trong cả món chay và món mặn, cách chế biến cũng dễ dàng, các món thường thấy như nấm nướng mỡ hành/phô mai, thả lẩu, xào xả ớt, nấu canh,…
                    Nấm Đùi Gà Tươi rất giàu dinh dưỡng cho cơ thể tiếp thu, từ đó giúp hỗ trợ hệ tiêu hóa đường ruột, giảm tiểu đường và huyết áp, kích thích vị giác hiệu quả.</p>

                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <td><strong>Giá nấm lẻ</strong></td>
                        <td>165.000 VND/kg</td>
                    </tr>
                    <tr>
                        <td><strong>Xuất xứ</strong></td>
                        <td>Nông Trại Nấm Xanh Việt Nam</td>
                    </tr>
                    <tr>
                        <td><strong>Đóng gói</strong></td>
                        <td>Công ty TNHH Agrikgai</td>
                    </tr>
                    <tr>
                        <td><strong>Quy cách</strong></td>
                        <td>200gr, 500gr, 1kg</td>
                    </tr>
                    <tr>
                        <td><strong>Ngày sản xuất</strong></td>
                        <td>In trên bao bì (nấm mới mỗi ngày)</td>
                    </tr>
                    <tr>
                        <td><strong>Hạn sử dụng</strong></td>
                        <td>07 ngày (từ ngày sản xuất)</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="container mt-5" id="des1">
                <!-- Trang 1 -->
                <h2 class="text-center text-danger">Ưu điểm của Nấm Kim Châm Hàn Quốc Tươi</h2>
                <div class="text-center">
                    <img src="image/1735387762935_nam-bao-ngu-xam-tuoi-06.jpg" class="img-fluid" alt="Nấm Kim Châm" width="40%">
                </div>
                <ul class="mt-4">
                    <li>Nấm Kim Châm Hàn Quốc tươi là loại nấm có khá nhiều vitamin, chất xơ, protid, lipid và các loại axit amin.</li>
                    <li>Có các khoáng chất hữu ích, gồm cả Ergothioneine là một chất chống oxy hóa hữu dụng.</li>
                    <li>Là <span class="text-danger">thực phẩm ít calo</span>, phù hợp cho chị em phụ nữ ăn kiêng, giữ dáng.</li>
                    <li>Giàu giá trị dinh dưỡng hơn thịt, cá, trứng và sữa.</li>
                    <li>Dễ chế biến, phù hợp với nhiều món ăn chay và mặn.</li>
                </ul>
                <p class="fst-italic">*Axit amin không thể tự tổng hợp là phải ăn mới dung nạp được chứ cơ thể không tự sinh.</p>
            </div>

            <div class="container mt-5" id="des2">
                <!-- Trang 2 -->
                <h2 class="text-center text-danger">Hàm lượng dinh dưỡng trong Nấm Kim Châm Hàn Quốc tươi</h2>
                <div class="text-center">
                    <img src="image/1735387762935_nam-bao-ngu-xam-tuoi-06.jpg" class="img-fluid" alt="Nấm Kim Châm"  width="40%">
                </div>
                <ul class="mt-4">
                    <li>Chứa nhiều vitamin C, E, PP, và nhóm vitamin B (B1, B2, B6, B12...).</li>
                    <li>Nhiều Protein, Lipid và các khoáng chất (kẽm, kali,...).</li>
                    <li>Thực phẩm có nhiều chất xơ hơn một số loại rau củ.</li>
                    <li>Chứa 16 loại axit amin, gồm 8 loại cơ thể không thể tự tổng hợp.</li>
                    <li>Có Flammutoxin giúp tăng cường hấp thụ chất.</li>
                </ul>
                <h3 class="mt-4 text-danger">Cách sử dụng Nấm Kim Châm Hàn Quốc</h3>
                <h4 class="mt-3">Cách sơ chế nấm tươi</h4>
                <ul>
                    <li>Dùng kéo/dao bén cắt nhẹ phần gốc nấm khoảng 2cm.</li>
                    <li>Rửa sơ với nước bằng cách bỏ vào thau nước rồi chà nhẹ.</li>
                    <li>Tách lẻ thành từng chùm nhỏ hoặc từng cây nấm đơn lẻ.</li>
                </ul>
                <h4 class="mt-3 text-danger">Lưu ý khi sơ chế</h4>
                <p>Nấm rất dễ hút nước, không nên rửa hoặc ngâm trong nước quá lâu.</p>
                <p>Nấm đã sạch, hạn chế hoặc không nên bóp muối vì sẽ làm nấm mất đi vị ngon ngọt tự nhiên.</p>
            </div>
            <div class="container mt-5" id="des3">
                <!-- Trang 2 -->
                <h2 class="text-danger">Cách chế biến Nấm Kim Châm Hàn Quốc Tươi</h2>
                <div class="text-center">
                    <img src="image/1735387762935_nam-bao-ngu-xam-tuoi-06.jpg" class="img-fluid" alt="Nấm Kim Châm"  width="40%">
                </div>
                <p>Có khá nhiều cách chế biến Nấm Kim Châm ngon để sử dụng rất đơn giản, như bạn có thể làm các món xào, canh, cháo hoặc kết hợp các món nướng với thịt… sẽ cực kỳ thơm ngon, chay mặn đều được.</p>
                <h4 class="mt-3">Một số gợi ý bạn làm những món ngon như:</h4>
                <ul class="mt-4">
                    <li>Nấm xào trứng/cà chua/chay</li>
                    <li>Canh rong biển Kim Châm</li>
                    <li>Bò cuộn Kim Châm</li>
                    <li>Nấm trộn cay</li>
                    <li>Nấm sốt đậu</li>
                </ul>
                <h3 class="mt-4 text-danger">Tác dụng của Nấm Kim Châm Hàn Quốc Tươi</h3>
                <ul>
                    <li>Điều hòa hệ miễn dịch và tăng cường sức đề kháng hiệu quả nhờ lượng Protein.</li>
                    <li>Cải thiện trí nhớ ở người lớn tuổi và tăng cường trí nhớ ở trẻ nhỏ nhờ có nhiều Lysin và Kẽm.</li>
                    <li>Điều hòa huyết áp (giảm với người hay tăng huyết áp).</li>
                </ul>
                <h4 class="mt-3 text-danger">Cách bảo quản Nấm Kim Châm Hàn Quốc Tươi</h4>
                <p>Khi bạn mua về, nếu đã cắt bịch ra rồi thì bạn nên dùng ngay trong ngày là ngon nhất. Nếu chưa dùng nấm ngay bạn nên để nguyên trong túi/khay và cho vào tủ lạnh ở ngăn mát hoặc tủ mát từ 3-5 độ C sẽ bảo quản được lên tới 15 ngày, tốt nhất bạn nên dùng trong 3-5 ngày đầu để đảm bảo độ tươi ngọt tự nhiên của nấm..</p>
                <p>Khi lấy nấm ra để chế biến nhưng dùng không hết, nếu chưa ngâm nước bạn có thể cho phần nấm vào lại túi và bỏ lại vô tủ lạnh. Nếu đã ngâm/rửa nước bạn nên dùng hết cho chế biến để nấm không bị nhũn nấm. Còn khi đã chế biến mà ăn không hết, bạn có thể gói nấm vào giấy bạc và cho vào tủ lạnh, hôm sau hâm nóng lại dùng.</p>
                <h4 class="mt-3 text-danger">Mua Nấm Kim Châm Hàn Quốc tươi ở đâu?</h4>
                <p>Bạn có thể đặt Nấm Kim Châm Hàn Quốc Tươi cùng nhiều loại nấm tươi khác qua các Kênh Bán Lẻ của Nấm Xanh. Bao gồm đặt ngay trên website này, đặt nhanh qua các kênh chat (ZaloOA, Zalo/Hotline 0868032463, Fanpage), đặt từ nền tảng TMĐT có giao Hỏa Tốc (Lazada, Shopee, TikiNGON, ShopeeFood, GrabMart) và TiktokShop..</p>
                <p>Nếu bạn muốn ghé tận nơi, có thể tìm Store Nấm Xanh trên Google Maps nha. Do sản lượng nấm mỗi ngày Nấm Xanh xuất kho đến các đối tác hệ thống siêu thị, nhà hàng, chuỗi ẩm thực, nhà máy,… là rất lớn. Nên bạn có thể đặt trước, hoặc gọi trước khi đến để đảm bảo còn hàng loại nấm bạn cần.</p>
                <h4 class="mt-3 text-danger">Mua hàng tại Nấm Xanh có an tâm?</h4>
                <p>Ở mỗi nông trại, chúng tôi đều đạt các chứng nhận VSATTP, gồm VietGAP tại một số vùng. Tại cơ sở sản xuất, chúng tôi cũng có những chứng nhận VSATTP, gồm HACCP. Bên cạnh đó, mỗi năm 2 lần chúng tôi luôn định kỳ kiểm nghiệm lại sản phẩm.</p>
                <div style="padding: 0;margin: 0;">
                    <img src="image/giay-chung-nhan-4tieu-chua-vsattp-haccp-ngang-1400px.jpg" alt="">
                </div>
                <p>Khi kết hợp với các nhà máy sản xuất, Nấm Xanh cũng đều ưu tiên chọn lựa những đơn vị uy tín và đủ chứng nhận, có danh mục sản xuất chất lượng và lịch sử gia công cho các đơn vị lớn. Do đó, bạn hãy an tâm khi mua hàng tại Nấm Xanh.</p>
                <p class="text-center"><b >CẢM ƠN BẠN VÌ ĐÃ QUAN TÂM ĐẾN SẢN PHẨM CỦA NẤM XANH</b></p>
            </div>



        </div>

        <!-- Tab Đánh Giá -->
        <div class="tab-pane fade" id="danh-gia">
            <h5 class="fw-bold">Đánh giá sản phẩm</h5>
            <div class="container mt-4">
                <div class="row">
                    <!-- Cột đánh giá trung bình -->
                    <div class="col-md-3 text-center">
                        <h2 class="text-warning fw-bold">5.0 <i class="fas fa-star"></i></h2>
                        <p class="fw-bold">ĐÁNH GIÁ TRUNG BÌNH</p>
                    </div>

                    <!-- Cột chi tiết đánh giá -->
                    <div class="col-md-6">
                        <!-- Dòng đánh giá 5 sao -->
                        <div class="d-flex align-items-center">
                            <span class="fw-bold">5 <i class="fas fa-star star"></i></span>
                            <div class="flex-grow-1 mx-2 rating-bar">
                                <div class="rating-fill" style="width: 100%;"></div>
                            </div>
                            <span class="text-primary fw-bold">100% | 16 đánh giá</span>
                        </div>
                        <!-- Các dòng còn lại -->
                        <div class="d-flex align-items-center">
                            <span class="fw-bold">4 <i class="fas fa-star"></i></span>
                            <div class="flex-grow-1 mx-2 rating-bar">
                                <div class="rating-fill" style="width: 0%;"></div>
                            </div>
                            <span class="text-primary">0% | 0 đánh giá</span>
                        </div>
                        <div class="d-flex align-items-center">
                            <span class="fw-bold">3 <i class="fas fa-star"></i></span>
                            <div class="flex-grow-1 mx-2 rating-bar">
                                <div class="rating-fill" style="width: 0%;"></div>
                            </div>
                            <span class="text-primary">0% | 0 đánh giá</span>
                        </div>
                        <div class="d-flex align-items-center">
                            <span class="fw-bold">2 <i class="fas fa-star"></i></span>
                            <div class="flex-grow-1 mx-2 rating-bar">
                                <div class="rating-fill" style="width: 0%;"></div>
                            </div>
                            <span class="text-primary">0% | 0 đánh giá</span>
                        </div>
                        <div class="d-flex align-items-center">
                            <span class="fw-bold">1 <i class="fas fa-star"></i></span>
                            <div class="flex-grow-1 mx-2 rating-bar">
                                <div class="rating-fill" style="width: 0%;"></div>
                            </div>
                            <span class="text-primary">0% | 0 đánh giá</span>
                        </div>

                    </div>

                    <!-- Cột nút đánh giá -->
                    <div class="col-md-3 text-center">
                        <button class="btn btn-primary">ĐÁNH GIÁ NGAY</button>
                    </div>
                </div>
                <hr>

                <div class="container mt-4" id="review">
                    <%
                        List<Feedback> feedbacks = (List<Feedback>) session.getAttribute("feedbacks");
                        System.out.println(feedbacks.size() + "Size feedback");
                    %>
                    <c:forEach var="item" items="${sessionScope.feedbacks}">
                        <div class="review-item" id="review-list">
                            <p class="review-name">${item.userName} ${item.phoneNumber}
                                <span class="verified-badge"><i class="fas fa-check-circle"></i> Đã mua hàng tại Nấm Xanh</span>
                            </p>

                            <p class="text-warning">
                                <c:forEach begin="1" end="${item.ratingRank}">
                                    <i class="fas fa-star"></i>
                                </c:forEach>
                                <c:forEach begin="${item.ratingRank + 1}" end="5">
                                    <i class="far fa-star"></i>
                                </c:forEach>
                            </p>

                            <p class="review-text">${item.status}</p>

                            <!-- Phần hiển thị ảnh đánh giá -->
                            <c:if test="${not empty item.reviewImages}">
                                <div class="review-images">
                                   <c:forEach items="${item.reviewImages}" var="image" varStatus="loop">
                                       <c:if test="${loop.index < 5}"> <!-- Giới hạn hiển thị tối đa 5 ảnh -->
                                            <img src="img/${image}" alt="Ảnh đánh giá ${loop.index + 1}"
                                                 class="review-thumbnail"
                                                 onclick="openImageModal('img/${image}')">
                                       </c:if>
                                   </c:forEach>
                                   <c:if test="${fn:length(item.reviewImages) > 5}">5
                                        <div class="more-images">+${fn:length(item.reviewImages) - 5}</div>
                                 </c:if>
                                </div>
                          </c:if>

                            <div class="review-tags">
                                <span>${item.comment}</span>
                            </div>

                            <div class="review-actions">
                                <i class="far fa-thumbs-up"></i> 0
                                <i class="far fa-thumbs-down"></i> 0
                                <a href="#">Trả lời</a>
                                <a href="#">3 thích</a>
                                <span>• ${item.createDate}</span>
                            </div>
                        </div>

                        <!-- Modal hiển thị ảnh lớn -->
                        <div id="imageModal" class="modal">
                            <span class="close" onclick="closeImageModal()">&times;</span>
                            <img class="modal-content" id="modalImage">
                            <div class="modal-caption"></div>
                        </div>

                    </c:forEach>
                </div>
            </div>
        </div>

        <!-- Tab Vận Chuyển -->
        <div class="tab-pane fade" id="van-chuyen">
            <h5 class="fw-bold">Thông tin vận chuyển</h5>
            <div class="container">
                <div class="delivery-container row">
                    <div class="col-md-6 text-center">
                        <img src="image/hinh-thuc-giao-hang-nong-trai-nam-xanh-800px.jpg" alt="Shipper" class="img-fluid">
                    </div>
                    <div class="col-md-6 delivery-text">
                        <h5>Các đơn hàng <span class="text-primary">Nội Thành TP HCM</span> sẽ được giao bởi:</h5>
                        <ul>
                            <li>Shipper Nấm Xanh (D+1), tức hôm nay khách đặt mai Nấm Xanh giao, với phí vận chuyển là 35.000đ đồng giá cho đơn dưới 500K (Freeship đơn từ 500K), hoặc theo khu vực KH nếu gần với Kho Nấm Xanh Q12 sẽ tính giá theo các đơn vị Hỏa Tốc, có thể rẻ hơn.</li>
                            <li>Shipper Grab/Ahamove/Be/... tức giao gấp 2h-4h theo yêu cầu của khách hàng, phí vận chuyển sẽ tính thực tế tại thời điểm giao hàng hiện trên ứng dụng (có thể gồm voucher và trợ giá từ Nấm Xanh). KH cũng có thể chủ động book shipper ghé Kho Nấm Xanh lấy hàng. Nấm Tươi sẽ ưu tiên book giao trong 2 giờ, Nấm Khô ưu tiên book giao trong 4 giờ.</li>
                        </ul>
                        <h5>Các đơn hàng <span class="text-primary">Ngoại Thành HCM</span></h5>
                        <ul>
                            <li>Các đơn hàng Ngoại Thành HCM có phí vận chuyển là 35.000đ đồng giá cho đơn dưới 1 triệu (Freeship đơn từ 1 triệu), đã gồm trợ giá nếu phí thực tế cao hơn. Giao chủ yếu bởi SPX (Shopee Express), GHTK (GiaoHangTietKiem) khắp cả nước. Giao được sản phẩm Nấm Khô, Bột Nấm, Nấm Dược.</li>
                            <li>Nấm Xanh không hỗ trợ giao Nấm Tươi ngoài TP HCM, nếu KH ở các tỉnh kề cận TP HCM và có quen chành xe, giao hàng trong 1 ngày, Nấm Tươi sẽ được đóng thùng xốp, chèn gel lạnh để giao chành. Phí vận chuyển sẽ gồm phí chành xe báo, phí thùng xốp & gel lạnh,... (Nấm Xanh sẽ hỗ trợ 1 phần) và KH buộc phải thanh toán chuyển khoản trước 100%.</li>
                        </ul>
                        <p><strong>Nấm Xanh</strong> hỗ trợ giao hàng Tỉnh nếu có quen xe.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Tab Về Nấm Xanh -->
        <div class="tab-pane fade" id="ve-nam-xanh">
            <h5 class="fw-bold">Giới thiệu về Nấm Xanh</h5>
            <div class="container content-section">
                <div class="row align-items-center">
                    <div class="col-lg-6">
                        <p><strong>Thương hiệu Nông Trại Nấm Xanh</strong> (thuộc Công ty TNHH Agrikgai) ra đời vào cuối năm 2018, chuyên nuôi trồng các loại nấm, trực tiếp sản xuất và đóng gói thành phẩm...</p>
                        <p>Hiện nay, chúng tôi là một Nhà Cung Cấp uy tín cho nhiều đơn vị lớn từ chuỗi nhà hàng, siêu thị, cửa hàng tiện lợi đến các máy lớn có tên tuổi VN...</p>
                        <p>Cam kết của Nấm Xanh chính là <strong>"PHỤC VỤ TẬN TÂM - CHĂM SÓC TẬN TÌNH - HỖ TRỢ HẾT MÌNH"</strong>. Chúng tôi luôn phục vụ khách hàng bằng tất cả trái tim.</p>
                    </div>
                    <div class="col-lg-6 image-container">
                        <img src="image/tphcm-trai-nam-xanh-long-an.jpg" alt="Hình ảnh nông trại">
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</section>
<section>
    <div class="row">
        <div class="border border-1 mt-3"></div>
    </div>
    <div class="container">
        <div class="row ms-3">
            <div class="fw-bold text-danger fs-4 mt-4">Sản Phẩm Tương Tự</div>
        </div>
        <div class="row">
            <div class="col d-flex justify-content-center">
                <ul class="nav mt-4">
                    <c:forEach var="item" items="${sessionScope.productSimilar.items}">
                        <a href="product_detail?id=${item.id}">
                            <li class="nav-item ms-3" style="width: auto">
                                <div class="h-100 d-inline-block border border-2 rounded" style="height:100px">
                                    <div class="container">
                                        <div class="img_product">
                                            <img src="${pageContext.request.contextPath}/img/${item.fileName1}" style="width: 190px;" class="" alt="...">
                                        </div>
                                    </div>
                                    <div class="border rounded d-flex justify-content-start fs-6" style="background-color: #B0501D">
                                        <div class="text-light fw-light ms-3 pt-0"  style="width: 160px"><i class="fa-regular fa-gem"></i> Tích 39-165 NAXA khi mua sản phẩm này</div>
                                    </div>
                                    <div class="product_infor mt-3 d-flex justify-content-center">
                                        <button data-weight="200" class="btn">200g</button>
                                        <button data-weight="500" class="btn">500g</button>
                                        <button data-weight="1000" class="btn">1kg</button>
                                    </div>
                                    <div class="product_name mt-1 d-flex justify-content-center" style="color: black; ">${item.name}</div>
                                    <div class="mt-3 d-flex justify-content-center fw-bold text-danger" style="--bs-text-opacity: 0.8;"><fmt:formatNumber value="${item.priceMin}" type="number" groupingUsed="true" /> đ - <fmt:formatNumber value="${item.priceMax}" type="number" groupingUsed="true" /> đ</div>
                                </div>
                            </li>
                        </a>


                    </c:forEach>



                </ul>
            </div>

            </div>
        </div>
    </div>
</section>
<section>
    <div class="row">
        <div class="border mt-3" style="background-color: #d9d6d6; height: 70px"></div>
    </div>
</section>
<%@include file="footer.jsp"%>
<script>
    // Cập nhật giá trị cho trường ẩn "weight" khi người dùng chọn quy cách
    function updateWeight(weight) {
        document.getElementById('selectedWeight').value = weight;
    }
    function updateQuantity(change) {
        const quantityField = document.getElementById('quantity');
        const displayQuantity = document.getElementById('displayQuantity');

        // Lấy giá trị hiện tại
        let currentQuantity = parseInt(quantityField.value);

        // Tính giá trị mới
        currentQuantity += change;

        // Đảm bảo số lượng không nhỏ hơn 1
        if (currentQuantity < 1) {
            currentQuantity = 1;
        }

        // Cập nhật giá trị mới
        quantityField.value = currentQuantity;
        displayQuantity.textContent = currentQuantity;
    }
    function submitFormNow() {
        // Lấy đối tượng form
        const form = document.querySelector('form');

        // Lấy giá trị của các tham số từ các yếu tố input (ví dụ từ form)
        const productID = document.querySelector('input[name="productID"]').value; // Lấy giá trị productID từ input
        const weight = document.querySelector('input[name="weight"]').value;       // Lấy giá trị weight từ input
        const quantity = document.querySelector('input[name="quantity"]').value;   // Lấy giá trị quantity từ input

        // Cập nhật action của form với các giá trị này
        form.action = `buyProduct?productID=${productID}&weight=${weight}&quantity=${quantity}`;

        // Gửi form
        form.submit();
    }
    function updateWeight(weight) {
        // Ẩn tất cả các phần tử collapse (bao gồm các giá cũ)
        document.querySelectorAll('.collapse').forEach(function(collapse) {
            collapse.classList.remove('show');
        });
updateWeight1(weight);
        // Kiểm tra quy cách và hiển thị giá tương ứng
        if (weight === '200') {
            document.getElementById('collapseExample1').classList.add('show');
        } else if (weight === '500') {
            document.getElementById('collapseExample2').classList.add('show');
        } else if (weight === '1000') {
            document.getElementById('collapseExample3').classList.add('show');
        }
    }

    function updateWeight1(weightValue) {
        // Cập nhật giá trị weight trong form
        document.getElementById('selectedWeight').value = weightValue;
    }
    function openImageModal(imageSrc) {
        const modal = document.getElementById('imageModal');
        const modalImg = document.getElementById('modalImage');
        modal.style.display = "block";
        modalImg.src = imageSrc;
    }

    function closeImageModal() {
        document.getElementById('imageModal').style.display = "none";
    }

    // Đóng modal khi click bên ngoài ảnh
    window.onclick = function(event) {
        const modal = document.getElementById('imageModal');
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>
<script src="js/bootstrap.bundle.min.js"></script>

<script src="js/duavaogiohang.js "></script>
</body>
</html>