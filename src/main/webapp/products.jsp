<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Models.Product.ListProduct" %>
<%@ page import="Models.Category.Category" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: airm2
  Date: 13/12/2024
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sản Phẩm</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">



    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <link rel="stylesheet" href="css/fontawesome.css">
    <link rel="stylesheet" href="css/templatemo-space-dynamic.css">
    <link rel="stylesheet" href="css/animated.css">
    <link rel="stylesheet" href="css/owl.css">
    <!--    <link rel="stylesheet" href="css/bootstrap.min.css">-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<style>
    /* Khung sản phẩm */
    .product-item {
        border: 1px solid #ddd;
        transition: transform 0.3s ease, box-shadow 0.3s ease, background-color 0.3s ease;
        border-radius: 12px;
        overflow: hidden;
        position: relative;
        background: #fff;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    .product-item:hover {
        transform: translateY(-5px);
        box-shadow: 0 12px 20px rgba(0, 0, 0, 0.2);
    }

    /* Hình ảnh sản phẩm */
    .img_product {
        position: relative;
        width: 100%;
        height: auto;
        overflow: hidden;
    }

    .default-img {
        width: 100%;
        height: auto;
        object-fit: cover;
        display: block;
        transition: opacity 0.3s ease-in-out;
    }

    .hover-img {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: auto;
        object-fit: cover;
        opacity: 0;
        transition: opacity 0.3s ease-in-out;
    }

    .img_product:hover .default-img {
        opacity: 0;
    }

    .img_product:hover .hover-img {
        opacity: 1;
    }

    /* Vùng hiển thị icon */
    .product-icons {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        display: flex;
        gap: 20px;
        opacity: 0;
        visibility: hidden;
        transition: opacity 0.3s ease-in-out, visibility 0.3s ease-in-out;
        z-index: 10;
    }

    .img_product:hover .product-icons {
        opacity: 1;
        visibility: visible;
    }

    /* Icon */
    .product-icons i {
        font-size: 22px;
        color: white;
        background: rgba(0, 0, 0, 0.6);
        padding: 12px;
        border-radius: 50%;
        cursor: pointer;
        transition: transform 0.3s ease, background-color 0.3s ease;
    }

    /* Hiệu ứng khi hover icon */
    .cart-icon:hover {
        transform: scale(1.2);
        background-color: #28a745;
    }

    .heart-icon:hover {
        transform: scale(1.2);
        background-color: #e74c3c;
    }

    /* Nút trọng lượng */
    .product_infor button {
        font-size: 0.9rem;
        padding: 6px 12px;
        cursor: pointer;
        transition: background-color 0.3s ease, color 0.3s ease;
    }

    .product_infor button:hover {
        background-color: #f8f9fa;
        border-color: #007bff;
        color: #007bff;
    }

    /* Tên sản phẩm */
    .product_name {
        font-size: 1.1rem;
        font-weight: bold;
    }

    /* Giá */
    .price {
        font-size: 1.3rem;
        color: #dc3545;
    }
    /* Kiểu dáng thông báo */
    .notification {
        position: fixed;
        top: -100px; /* Đặt ban đầu thông báo nằm ngoài màn hình */
        right: 10px;
        background-color: rgba(0, 0, 0, 0.8);
        color: white;
        padding: 15px;
        border-radius: 8px;
        max-width: 300px;
        width: auto;
        z-index: 9999;
        opacity: 0; /* Ban đầu thông báo trong suốt */
        transition: opacity 0.5s ease-in-out, top 0.5s ease-out; /* Hiệu ứng mờ dần và di chuyển từ trên xuống */
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3); /* Tạo hiệu ứng bóng cho thông báo */
        font-family: Arial, sans-serif;
        font-size: 14px;
        line-height: 1.4;
    }

    .notification.show {
        opacity: 1; /* Hiển thị với độ mờ dần */
        top: 10px; /* Di chuyển vào vị trí hiển thị */
    }

    .notification .product-info {
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    .notification .product-info .product-name {
        font-weight: bold;
        margin-bottom: 5px;
    }

    .notification .product-info .product-price {
        color: #ff6f61;
        margin-bottom: 5px;
    }

    .notification .product-info .product-quantity {
        color: #fff;
        font-size: 12px;
    }
    .img_product img {
        width: 450px;
        height: 450px;
        /*width: 100%; !* Chiều rộng chiếm toàn bộ container *!*/
        /*height: 200px; !* Chiều cao cố định *!*/
        object-fit: cover; /* Cắt ảnh để phù hợp với kích thước container */
        border-bottom: 1px solid #eee; /* Đường viền dưới */
        border-radius: 5px;
    }

    /* Ẩn ảnh hover mặc định */
    /*.img_product .hover-img {*/
    /*    opacity: 0;*/
    /*    object-fit: cover;*/
    /*}*/

    /*!* Hiển thị ảnh hover khi di chuột *!*/
    /*.img_product:hover .hover-img {*/
    /*    opacity: 1;*/
    /*}*/

    /*.img_product:hover .default-img {*/
    /*    opacity: 0;*/
    /*}*/
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
    .product-item {
        display: flex;
        align-items: center;
        margin-bottom: 1rem;
    }

    .product-info {
        flex: 1;
        display: flex;
        flex-direction: column;
        justify-content: center;
        padding-left: 10px;
    }

    .product-info a {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        max-width: 200px; /* Điều chỉnh chiều rộng tùy thuộc vào không gian của bạn */
    }

    .price-range {
        font-size: 14px;
        font-weight: bold;
    }

    .nav {
        display: flex;
        padding: 0;
        margin: 0;
    }

    .nav li {
        margin-right: 5px;
    }

    .nav i {
        font-size: 16px;
    }

    .search-form {
        width: 50%;
        margin: 0 auto;
        display: flex;
        align-items: center;
    }

    .search-form input[type="text"] {
        width: 90%;
        padding: 10px;
        border-radius: 5px;
        margin-right: 10px;
        border: 1px solid #ccc;
    }

    .search-form button {
        padding: 10px 15px;
        background-color: #f8f9fa;
        border: 1px solid #ccc;
        border-radius: 5px;
        cursor: pointer;
    }

    .search-form button i {
        color: #000;
    }


    .product-card::before {
        content: "";
        position: absolute;
        width: 80px;  /* Độ dài vệt sáng */
        height: 5px; /* Độ dày vệt sáng */
        background: linear-gradient(90deg, rgba(255, 102, 153, 1), rgb(238, 16, 16), rgba(255, 204, 102, 1));
        filter: blur(3px); /* Làm mờ ánh sáng */
        animation: borderRun1 4s linear infinite;
        z-index: 20;
    }

    @keyframes borderRun1 {
        0%   { top: 0; left: 0; width: 80px; height: 5px; }  /* Góc trái trên */
        25%  { top: 0; left: 100%; transform: translateX(-100%); } /* Chạy sang phải */
        50%  { top: 100%; left: 100%; transform: translateY(-180%); rotate: 0deg; } /* Chạy xuống */
        75%  { top: 100%; left: 0; transform: translateX(0%); rotate: 180deg; } /* Chạy sang trái */
        100% { top: 0; left: 0; transform: rotate(270deg); } /* Quay lại điểm ban đầu */
    }



</style>
<body>
<%@include file="header.jsp"%>

<section style="background-color: rgb(254,235,205)">
    <div class="row">
        <div class="d-flex justify-content-center">
            <div class="main_name fw-bold text-danger text-center fs-1 ">Sản Phẩm</div>
        </div>
    </div>
    <div class="row">
        <div class="col p-3 text-black">
            <div class="d-flex justify-content-center">
                <ul class="nav">
                    <c:forEach var="category" items="${categoryProductCounts.keySet()}">
                        <li class="nav-item">
                            <div class="">
                                <a class="nav-link fw-bold text-dark pb-0" href="#">${category}</a>
                                <a class="nav-link fw-medium text-secondary pt-0" href="product_category?idCategory=">
                                        ${categoryProductCounts[category]} Sản Phẩm
                                </a>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</section>
<section class="menu">
    <div class="container">
        <div class="row" style="margin-top: 20px" >
            <form action="products" method="GET" class="search-form">
                <input oninput="searchByName(this)"  type="text" name="productName" placeholder="Tìm kiếm sản phẩm..." class="form-control" style="border-radius: 15px;width: 80%;margin-left: 100px">
                <button type="submit" class="btn"style="border-radius: 15px;">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
            </form>
        </div>

        <div class="row">
            <div class="col-3 text-danger fw-bold fs-5 mt-5" style="--bs-text-opacity: .85;">
                <div class="d-flex ps-1">
                    MENU SẢN PHẨM
                </div>
            </div>
            <div class="col-3 mt-5">
                <div class="d-flex justify-content-center">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a class="text-secondary" href="#">Trang Chủ</a></li>
                            <li class="breadcrumb-item"><a class="text-secondary" href="products">Sản Phẩm</a></li>
                            <li class="breadcrumb-item" aria-current="page">Data</li>
                        </ol>
                    </nav>
                </div>
            </div>
            <div class="col-3 mt-5">
            </div>
            <div class="col-3 mt-5">
                <div class="d-flex justify-content-center">
                    <button type="button" class="btn dropdown-toggle fw-bold" data-bs-toggle="dropdown">Thứ tự theo mức độ phổ biến</button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="products?filterType=priceAsc">Thứ tự theo giá: thấp đến cao</a></li>
                        <li><a class="dropdown-item" href="products?filterType=priceDesc">Thứ tự theo giá: cao đến thấp</a></li>
                        <li><a class="dropdown-item" href="products?filterType=newest">Mới nhất</a></li>
                        <li><a class="dropdown-item" href="products?filterType=rating">Thứ tự theo đánh giá</a></li>
                        <li><a class="dropdown-item" href="products?filterType=promotion">Thứ tự theo khuyến mãi</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="content">
    <%
        ListProduct item = (ListProduct) session.getAttribute("listproduct");
        if(item == null){
            item = new ListProduct();
            session.setAttribute("listproduct",item);
        }

    %>
    <div class="container">
        <div class="row">
            <div class="col-3">
                <div class="d-flex ps-1">
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
                                        <div class="badge border text-bg-light">${item.quantity}</div> <!-- Thay số 4 bằng giá trị thực tế -->
                                    </div>
                                </ul>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="pt-2 mb-4">
                    <form action="products" method="get" id="priceRangeForm">
                        <label for="minPrice" class="form-label text-danger fw-bold fs-5">Khoảng Giá</label>

                        <div class="position-relative">
                            <!-- Thanh trượt giá tối thiểu -->
                            <div class="d-flex align-items-center mb-2">
                                <label for="minPrice" class="me-2">Từ:</label>
                                <input
                                        type="number"
                                        id="minPrice"
                                        name="minPrice"
                                        class="form-control"
                                        min="0"
                                        max="2000000"
                                        value="0"
                                        oninput="validatePriceRange()">
                            </div>

                            <!-- Thanh trượt giá tối đa -->
                            <div class="d-flex align-items-center">
                                <label for="maxPrice" class="me-2">Đến:</label>
                                <input
                                        type="number"
                                        id="maxPrice"
                                        name="maxPrice"
                                        class="form-control"
                                        min="0"
                                        max="2000000"
                                        value="2000000"
                                        oninput="validatePriceRange()">
                            </div>
                        </div>

                        <div class="mt-3">
                            <button type="submit" class="btn btn-danger">Lọc theo giá</button>
                        </div>
                    </form>
                </div>
                <section class="my-4">
                    <button class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#storeModal" style=" background: linear-gradient(135deg, #ff512f, #dd2476);">
                        <i class="bi bi-shop"></i> Chọn cửa hàng
                    </button>
                </section>
                <h5 class="fw-bold">Cửa hàng đang chọn<i class="fa-solid fa-store"></i>: <span id="selectedStore" class="text-danger">Chưa chọn</span></h5>
                <div class="modal fade" id="storeModal" tabindex="-1" aria-labelledby="storeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title fw-bold" id="storeModalLabel">
                                    <i class="bi bi-shop-window"></i> Chọn cửa hàng
                                </h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <!-- Bộ lọc tìm kiếm -->
                                <div class="row g-3">
                                    <div class="col-md-5">
                                        <label class="form-label">Tỉnh/Thành phố</label>
                                        <select class="form-select">
                                            <option>Bắc Giang</option>
                                            <option>Hà Nội</option>
                                            <option>Hồ Chí Minh</option>
                                        </select>
                                    </div>
                                    <div class="col-md-5">
                                        <label class="form-label">Quận/Huyện</label>
                                        <select class="form-select">
                                            <option>Lạng Giang</option>
                                            <option>Việt Yên</option>
                                            <option>Yên Dũng</option>
                                        </select>
                                    </div>
                                    <div class="col-md-2 d-flex align-items-end">
                                        <button class="btn btn-danger w-100">
                                            <i class="bi bi-search"></i> Tìm kiếm
                                        </button>
                                    </div>
                                </div>

                                <!-- Danh sách cửa hàng -->
                                <h4 class="mt-4 fw-bold text-center text-uppercase">Danh sách cửa hàng</h4>
                                <div class="row mt-3">
                                    <div class="col-md-6">
                                        <div class="card store-card p-3 shadow-sm text-center" onclick="selectStore('CHTT Lạng Giang BGG')">
                                            <h5 class="fw-bold"><i class="bi bi-geo-alt-fill"></i> CHTT Lạng Giang BGG</h5>
                                            <p>Số 207 - Phố Voi - Thị Trấn Voi - Huyện Lạng Giang</p>
                                            <p><i class="bi bi-telephone-fill"></i> 18008098</p>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="card store-card p-3 shadow-sm text-center" onclick="selectStore('Chi nhánh Viettel')">
                                            <h5 class="fw-bold"><i class="bi bi-geo-alt-fill"></i> Chi nhánh Viettel</h5>
                                            <p>Số 332 đường Hồ Cát, Thị trấn Vôi, Bắc Giang</p>
                                            <p><i class="bi bi-telephone-fill"></i> 0977357868</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer d-flex justify-content-center">
                                <button type="button" class="btn btn-secondary px-4" data-bs-dismiss="modal">
                                    <i class="bi bi-x-circle"></i> Đóng
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="pt-3">
                        <div class="d-flex ps-1 text-danger fw-bold fs-5">Bán Chạy Nhất</div>
                    </div>

                    <div class="">
                        <c:forEach var="item" items="${sessionScope.topproduct.items}">
                            <ul class="nav mt-2 product-item id">
                                <a href="${pageContext.request.contextPath}/product_detail?id=${item.id}">
                                    <li class="h-80 d-inline-block pt-2" style="height:80px">
                                        <img src="img/${item.image}" style="width: 80px" alt="...">
                                    </li>
                                    <li class="product-info">
                                        <a class="nav-link fw-medium text-dark pt-1" href="#">${item.name}</a>
                                        <ul class="nav">
                                            <li><div class="ms-3"><i class="fa-solid fa-star" style="color: #FFD43B;"></i></div></li>
                                            <li><div><i class="fa-solid fa-star" style="color: #FFD43B;"></i></div></li>
                                            <li><div><i class="fa-solid fa-star" style="color: #FFD43B;"></i></div></li>
                                            <li><div><i class="fa-solid fa-star" style="color: #FFD43B;"></i></div></li>
                                            <li><div><i class="fa-solid fa-star" style="color: #FFD43B;"></i></div></li>
                                        </ul>
                                        <div class="ms-3 price-range">
                                            <fmt:formatNumber value="${item.minPrice}" type="number" groupingUsed="true" /> đ -
                                            <fmt:formatNumber value="${item.maxPrice}" type="number" groupingUsed="true" /> đ
                                        </div>
                                    </li>
                                </a>
                            </ul>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-9" style="" id = "content-product">
                <div class="d-flex ps-5" style="width: 100%;">

                    <ul class="nav d-flex flex-wrap gap-4" style="width: 100%">
                        <c:forEach var="item" items="${sessionScope.listproduct.items}">
                            <li class="col-md-3 col-sm-5" style="margin-bottom: 15px;">
                                <div class="card product-card" style="border: 1px solid rgb(227, 227, 227); height: 400px;">
                                    <!-- Hình ảnh sản phẩm -->
                                    <div class="img_product position-relative">
                                        <a href="${pageContext.request.contextPath}/product_detail?id=${item.id}" style="text-decoration: none; color: inherit;">
                                            <img src="img/${item.fileName1}" class="default-img " alt="Product Image" style="width: 100%; height: 200px; border-bottom: 1px solid #eee;">
                                            <img src="img/${item.fileName2}" class="hover-img position-absolute" alt="Hover Image" style="width: 100%; height: auto; top: 0; left: 0; transition: opacity 0.3s ease;">
                                        </a>
                                        <!-- Icons hiển thị khi hover -->
                                        <div class="product-icons product-image" style="top: 50%; left: 50%; transform: translate(-50%, -50%); transition: opacity 0.5s;">
                                            <!-- Icon giỏ hàng -->
                                            <form id="cart-form-${item.id}" action="product_deIcon" method="GET" style="display: none;">
                                                <input type="hidden" name="productID" value="${item.id}">
                                                <input type="hidden" name="weight" class="selected-weight" value="">
                                            </form>

                                            <!-- Icon giỏ hàng -->
                                            <a href="#"
                                               class="fas fa-shopping-cart cart-icon"
                                               style="font-size: 20px; background: rgba(0,0,0,0.6); color: white; padding: 10px; border-radius: 50%; text-decoration: none;"
                                               onclick="submitCartForm('${item.id}')">
                                            </a>
                                            <div id="notification1" class="alert alert-success" style="display: none; position: fixed; top: 20px; right: 20px; z-index: 1000;">
                                                Sản phẩm đã được thêm vào giỏ hàng thành công!
                                            </div>
                                            <!-- Icon yêu thích -->
                                            <a href="#"
                                               class="fas fa-heart heart-icon"
                                               style="font-size: 20px; background: rgba(0,0,0,0.6); color: white; padding: 10px; border-radius: 50%; text-decoration: none;"
                                               onclick="addToFavorites('${item.name}','', '${item.id}')">
                                            </a>
                                            <form id="favorites-form-${item.id}" action="addWishlist" method="POST" style="display: none;">
                                                <input type="hidden" name="productID" value="${item.id}">
                                                <input type="hidden" name="weight" value="">
                                            </form>
                                        </div>
                                    </div>
                                    <!-- Thông tin sản phẩm -->
                                    <div class="p-3 text-center">
                                        <div class="product_infor d-flex justify-content-center gap-2 mb-2">
                                            <button data-id="${item.id}" data-weight="200" class="btn btn-sm btn-outline-secondary rounded-pill weight-btn">200g</button>
                                            <button data-id="${item.id}" data-weight="500" class="btn btn-sm btn-outline-secondary rounded-pill weight-btn">500g</button>
                                            <button data-id="${item.id}" data-weight="1000" class="btn btn-sm btn-outline-secondary rounded-pill weight-btn">1kg</button>
                                        </div>
                                        <div class="product_name text-dark fw-bold mb-2">${item.name}</div>
                                        <div class="price text-danger fw-bold" style="font-size: 1.2rem;"><fmt:formatNumber value="${item.priceMin}" type="number" groupingUsed="true" /> đ - <fmt:formatNumber value="${item.priceMax}" type="number" groupingUsed="true" /> đ</div>
                                    </div>
                                </div>
                            </li>


                        </c:forEach>

                    </ul>


                </div>
                <div class="col-17 mt-5">
                    <div class="d-flex justify-content-center">
                        <nav aria-label="Page navigation example">
                            <div class="pagination">
                                <c:if test="${sessionScope.currentPage > 1}">
                                    <a href="product_category?idCategory=${sessionScope.idCate}&page=${sessionScope.currentPage - 1}" class="btn btn-primary">Previous</a>
                                </c:if>

                                <c:forEach begin="1" end="${sessionScope.totalPages}" var="i">
                                    <a href="product_category?idCategory=${sessionScope.idCate}&page=${i}" class="btn ${i == sessionScope.currentPage ? 'btn-secondary' : 'btn-outline-secondary'}">
                                            ${i}
                                    </a>
                                </c:forEach>

                                <c:if test="${sessionScope.currentPage < sessionScope.totalPages}">
                                    <a href="product_category?idCategory=${sessionScope.idCate}&page=${sessionScope.currentPage + 1}" class="btn btn-primary">Next</a>
                                </c:if>
                            </div>
                        </nav>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%@include file="footer.jsp"%>
<script>
    /* JavaScript cho nút active */
    document.querySelectorAll('.product_infor button').forEach(function(button) {
        button.addEventListener('click', function() {
            // Xóa class active khỏi tất cả các nút
            document.querySelectorAll('.product_infor button').forEach(function(btn) {
                btn.classList.remove('active');
            });
            // Thêm class active cho nút được chọn
            this.classList.add('active');
        });
    });

    function addToCart(productName, productPrice, img) {
        showNotification(productName, productPrice, 'cart', img);
    }

    function addToFavorites(productName, img, productId) {
        // Lấy trọng lượng từ sản phẩm đang được chọn
        var selectedWeight = document.querySelector('#cart-form-' + productId + ' .selected-weight').value;

        // Kiểm tra nếu chưa chọn trọng lượng
        if (!selectedWeight) {
            alert('Vui lòng chọn trọng lượng trước khi thêm vào danh sách yêu thích!');
            return;
        }

        // Cập nhật giá trị trọng lượng vào form
        var form = document.getElementById('favorites-form-' + productId);
        form.querySelector('input[name="weight"]').value = selectedWeight;

        // Gửi form
        form.submit();

        // Hiển thị thông báo
        showNotification(productName, '', 'favorite', img);
    }

    function showNotification(productName, productPrice, type, img) {
        var notification = document.getElementById('notification');
        var notificationImg = document.getElementById('notification-img');
        var notificationName = document.getElementById('notification-name');
        var notificationPrice = document.getElementById('notification-price');
        var notificationQuantity = document.getElementById('notification-quantity');

        // Cập nhật thông tin cho notification
        notificationName.innerText = productName;
        if (productPrice) {
            notificationPrice.innerText = productPrice.toLocaleString() + 'đ';
            notificationQuantity.innerText = 'Số lượng: 1';
        } else {
            notificationPrice.innerText = '';
            notificationQuantity.innerText = '';
        }

        // Hiển thị hình ảnh sản phẩm
        notificationImg.src = 'img/' + img;

        // Hiển thị thông báo ngay lập tức
        notification.style.display = 'block';
        notification.classList.add('show');

        // Ẩn dần thông báo sau 3 giây
        setTimeout(function() {
            notification.classList.remove('show');
        }, 3000);

        // Sau khi ẩn dần, ẩn hoàn toàn
        setTimeout(function() {
            notification.style.display = 'none';
        }, 3500);
    }

    // Object lưu các trọng lượng đã chọn
    var selectedWeights = {};

    // Lắng nghe sự kiện chọn trọng lượng
    document.querySelectorAll('.weight-btn').forEach(function(button) {
        button.addEventListener('click', function() {
            var productId = this.getAttribute('data-id');
            var weight = this.getAttribute('data-weight');

            // Lưu trọng lượng đã chọn vào object
            selectedWeights[productId] = weight;

            // Cập nhật class 'active-weight' cho nút được chọn
            document.querySelectorAll("[data-id='" + productId + "']").forEach(function(btn) {
                btn.classList.remove('active-weight');
            });
            this.classList.add('active-weight');

            // Cập nhật trọng lượng vào form ẩn
            var form = document.getElementById('cart-form-' + productId);
            var weightInput = form.querySelector('.selected-weight');
            weightInput.value = weight;
        });
    });

    // Gửi form khi nhấn vào icon giỏ hàng
    function submitCartForm(productId) {
        var form = document.getElementById('cart-form-' + productId);

        // Kiểm tra nếu chưa chọn trọng lượng
        if (!form.querySelector('.selected-weight').value) {
            alert('Vui lòng chọn trọng lượng trước khi thêm vào giỏ hàng!');
            return;
        }

        // Gửi form đến servlet
        form.submit();
    }
    function searchByName(param) {
        const txtsearch = param.value;
        console.log("Search term:", txtsearch); // Debug search term

        if (txtsearch.trim() === '') {
            // Nếu ô tìm kiếm trống, không gửi request
            return;
        }

        $.ajax({
            url: "SearchAjax",
            type: "GET",
            data: {
                productName: txtsearch
            },
            beforeSend: function() {
                // Hiển thị loading nếu cần
                document.getElementById("content-product").innerHTML = '<div class="text-center">Đang tìm kiếm...</div>';
            },
            success: function(data) {
                console.log("Received data:", data); // Debug response data
                const row = document.getElementById("content-product");
                if (data.trim() === '') {
                    row.innerHTML = '<div class="text-center">Không tìm thấy sản phẩm nào</div>';
                } else {
                    row.innerHTML = data;
                }
            },
            error: function(xhr, status, error) {
                console.log("Error:", error);
                const row = document.getElementById("content-product");
                row.innerHTML = '<div class="text-center text-danger">Đã xảy ra lỗi khi tìm kiếm</div>';
            }
        });
    }

</script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/updateProductPrice.js"></script>
</body>
</html>