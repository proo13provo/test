<%--
  Created by IntelliJ IDEA.
  User: airm2
  Date: 18/12/2024
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    /* Tùy chỉnh giao diện */
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        color: #333;
    }
    .quantity-control {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 5px; /* Khoảng cách giữa các nút */
    }

    .quantity-control button {
        width: 32px;
        height: 32px;
        line-height: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 18px;
        padding: 0;
    }

    .quantity-control input {
        width: 50px;
        text-align: center;
        font-size: 16px;
        padding: 3px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    .header-notice {
        background-color: #ffc107;
        text-align: center;
        padding: 10px 0;
        font-weight: bold;
    }

    /* Bảng sản phẩm */
    .table-products {
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        overflow: hidden;
    }

    .table-products th {
        background-color: #f8f9fa;
        text-transform: uppercase;
        font-weight: bold;
        color: #333;
    }

    .table-products td {
        vertical-align: middle;
        padding: 15px 10px;
    }

    .product-img {
        width: 80px;
        height: 80px;
        object-fit: cover;
        border-radius: 8px;
        border: 1px solid #ddd;
    }

    .quantity-control button {
        width: 30px;
        height: 30px;
        font-size: 18px;
        display: flex;
        justify-content: center;
        align-items: center;
        line-height: 1;
    }

    /* Mã ưu đãi */
    .discount-box {
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 10px;
        margin-top: 20px;
    }

    .discount-box input {
        flex-grow: 1;
        border-radius: 8px;
    }

    /* Cộng giỏ hàng */
    .cart-summary {
        background: linear-gradient(135deg, #ffffff, #f8f8f8);
        border-radius: 12px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px;
        border: 1px solid #eee;
    }

    .cart-summary h5 {
        font-size: 1.2rem;
        font-weight: bold;
        color: #d35400;
        margin-bottom: 20px;
        text-transform: uppercase;
    }

    .cart-summary li {
        display: flex;
        justify-content: space-between;
        padding: 10px 0;
        border-bottom: 1px dashed #ddd;
    }

    .cart-summary li:last-child {
        border-bottom: none;
    }

    .cart-summary .total-price {
        font-size: 1.4rem;
        font-weight: bold;
        color: #e74c3c;
    }

    /* Nút thanh toán */
    .btn-checkout {
        background-color: #d35400;
        color: white;
        font-size: 1rem;
        font-weight: bold;
        text-transform: uppercase;
        padding: 10px 15px;
        border: none;
        border-radius: 8px;
        transition: background-color 0.3s ease;
    }

    .btn-checkout:hover {
        background-color: #e67e22;
    }
    .progress-header {
        background-color: #f8f8f8;
        padding: 20px 0;
        display: flex;
        justify-content: center;
    }

    /* Step Container */
    .step-container {
        display: flex;
        align-items: center;
        justify-content: space-between;
        width: 80%;
        max-width: 800px;
    }

    /* Step Item */
    .step {
        display: flex;
        flex-direction: column;
        align-items: center;
        flex: 1;
        position: relative;
    }

    .step-icon {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background-color: #ddd;
        color: #fff;
        display: flex;
        justify-content: center;
        align-items: center;
        font-weight: bold;
        font-size: 1rem;
        transition: all 0.3s ease;
    }

    .step-text {
        margin-top: 8px;
        font-size: 0.9rem;
        color: #888;
        text-transform: uppercase;
        font-weight: 600;
    }

    /* Line Between Steps */
    .step-line {
        height: 2px;
        background-color: #ddd;
        flex: 1;
    }

    /* Active Step */
    .step.active .step-icon {
        background-color: #ff7b00; /* Màu cam nổi bật */
    }

    .step.active .step-text {
        color: #ff7b00; /* Màu cam cho text */
    }
    /* Thanh thông báo chính */
    .promo-banner {
        background-color: #fff7e6; /* Màu cam nhạt */
        color: #d48806; /* Màu cam đậm hơn để nổi bật */
        padding: 10px 15px;
        border: 1px solid #ffd591;
        border-radius: 6px;
        text-align: center;
        font-size: 15px;
        font-weight: 500;
        margin: 10px 0;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
    }

</style>
<body>
<header class="progress-header">
    <div class="step-container">
        <!-- Step 1 -->
        <div class="step active">
            <div class="step-icon">1</div>
            <div class="step-text">GIỎ HÀNG</div>
        </div>
        <!-- Line -->
        <div class="step-line"></div>
        <!-- Step 2 -->
        <div class="step">
            <div class="step-icon">2</div>
            <div class="step-text">THANH TOÁN</div>
        </div>
        <!-- Line -->
        <div class="step-line"></div>
        <!-- Step 3 -->
        <div class="step">
            <div class="step-icon">3</div>
            <div class="step-text">HOÀN TẤT</div>
        </div>
    </div>
</header>
</body>
</html>
