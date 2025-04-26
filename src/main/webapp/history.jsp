<%@ page import="Models.inforTransaction.Transaction" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="Models.WishlistProduct.WishlistProduct" %>
<%@ page import="Models.User.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: airm2
  Date: 21/12/2024
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lịch sử giao dịch</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --main-color: #ff5722; /* Màu cam chủ đạo */
            --light-color: #ffe7d9;
        }

        body {
            background-color: #f9f9f9;
            font-family: 'Arial', sans-serif;
        }

        .sidebar {
            background-color: var(--light-color);
            border-radius: 10px;
        }

        .sidebar .list-group-item {
            border: none;
        }

        .sidebar .list-group-item.active {
            background-color: var(--main-color);
            color: #fff;
            font-weight: bold;
        }

        .btn-primary {
            background-color: var(--main-color);
            border: none;
        }

        .btn-primary:hover {
            background-color: #ff5722;
        }

        .card {
            border-radius: 10px;
            border: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .card-body {
            padding: 1.5rem;
        }

        .table th {
            background-color: var(--light-color);
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #fff;
        }

        .table-striped tbody tr:nth-of-type(even) {
            background-color: var(--light-color);
        }

        .form-select, .form-control {
            border-radius: 20px;
        }

        .user-avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid var(--main-color);
        }

        h4 {
            color: var(--main-color);
        }

        .detail-section {
            display: none;
            margin-top: 20px;
        }

        .detail-section.active {
            display: block;
        }
        .product-item {
            background-color: #fff;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
        }

        .product-details {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .product-id, .product-price, .product-name {
            font-size: 14px;
            color: #333;
        }

        .product-id {
            color: #ff5722;
        }

        .product-price {
            color: #4caf50;
        }

        .product-name {
            font-weight: bold;
        }
        .detail-section {
            display: none;
            margin-top: 20px;
            transform: translateY(20px);
            opacity: 0;
            transition: transform 0.3s ease, opacity 0.3s ease;
        }

        .detail-section.active {
            display: block;
            transform: translateY(0);
            opacity: 1;
        }

        .product-item {
            background-color: #fff;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            opacity: 0;
            animation: fadeIn 0.6s ease forwards;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        .view-detail.clicked {
            background-color: #007bff;  /* Màu xanh dương khi nhấn */
            color: #fff;  /* Đổi màu chữ */
            border: 1px solid #0056b3;  /* Thêm đường viền khi nhấn */
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        td img{
            width: 60px;
            height: 60px;
            border-radius: 10px;
        }
        /* Modal - kiểu cơ bản */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4); /* Màu nền mờ */
            padding-top: 60px;
        }

        /* Nội dung modal */
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        /* Nút đóng modal */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        /* Định dạng các trường trong form */
        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input, .form-group textarea {
            width: 100%;
            padding: 8px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
        .notification {
            position: fixed;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            padding: 12px 24px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            gap: 12px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size: 16px;
            font-weight: 500;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            z-index: 1000;
            animation: slideIn 0.3s ease-out;
            max-width: 90%;
        }

        .notification.success {
            background-color: #f0fdf4;
            color: #166534;
            border: 1px solid #bbf7d0;
        }

        .notification.error {
            background-color: #fef2f2;
            color: #b91c1c;
            border: 1px solid #fecaca;
        }

        .notification .icon {
            width: 20px;
            height: 20px;
            flex-shrink: 0;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translate(-50%, -30px);
            }
            to {
                opacity: 1;
                transform: translate(-50%, 0);
            }
        }

        @media (max-width: 480px) {
            .notification {
                width: 90%;
                padding: 10px 16px;
                font-size: 14px;
            }
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0; top: 0;
            width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.4);
            backdrop-filter: blur(3px);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: #fff;
            padding: 2rem;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 500px;
            position: relative;
            animation: fadeIn 0.3s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .modal-content h2 {
            margin-bottom: 1rem;
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            color: #333;
        }

        .close {
            position: absolute;
            top: 16px;
            right: 16px;
            font-size: 24px;
            cursor: pointer;
            color: #999;
            transition: color 0.2s;
        }

        .close:hover {
            color: #ff4d4f;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: #333;
        }

        select, textarea {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ccc;
            border-radius: 12px;
            font-size: 16px;
            transition: all 0.3s;
        }

        select:focus, textarea:focus {
            border-color: #4a90e2;
            box-shadow: 0 0 0 3px rgba(74, 144, 226, 0.2);
            outline: none;
        }

        textarea {
            resize: none;
        }

        .rating-stars {
            display: flex;
            gap: 10px;
            font-size: 30px;
            cursor: pointer;
            justify-content: center;
        }

        .star {
            color: #ccc;
            transition: color 0.2s;
        }

        .star.selected,
        .star:hover,
        .star:hover ~ .star {
            color: #f7b500;
        }

        button[type="submit"] {
            background-color: #4a90e2;
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s;
        }

        button[type="submit"]:hover {
            background-color: #357abd;
        }
        /* Modal Tech Style */
        .tech-modal {
            font-family: 'Segoe UI', Roboto, 'Helvetica Neue', sans-serif;
        }

        .tech-modal .modal-container {
            max-width: 600px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            background: #fff;
            overflow: hidden;
        }

        .tech-modal .modal-content {
            padding: 30px;
        }

        .tech-modal .modal-header {
            margin-bottom: 25px;
            text-align: center;
        }

        .tech-modal .modal-header h2 {
            font-size: 24px;
            font-weight: 600;
            color: #1a1a1a;
            margin-bottom: 8px;
        }

        .tech-modal .modal-header .subtitle {
            color: #666;
            font-size: 14px;
            margin-bottom: 20px;
        }

        .tech-modal .product-preview {
            display: flex;
            align-items: center;
            background: #f9f9f9;
            border-radius: 8px;
            padding: 15px;
            margin-top: 20px;
        }

        .tech-modal .product-preview img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 4px;
            margin-right: 15px;
        }

        .tech-modal .product-info h4 {
            font-size: 16px;
            margin: 0 0 5px 0;
            color: #333;
        }

        .tech-modal .product-sku {
            font-size: 13px;
            color: #777;
        }

        /* Rating Section */
        .tech-modal .rating-section {
            margin-bottom: 25px;
        }

        .tech-modal .section-label {
            display: block;
            font-weight: 500;
            color: #333;
            margin-bottom: 12px;
            font-size: 15px;
        }

        .tech-modal .star-rating-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .tech-modal .star-rating {
            display: flex;
            flex-direction: row-reverse;
            justify-content: flex-end;
        }

        .tech-modal .star-rating input {
            display: none;
        }

        .tech-modal .star-rating label {
            font-size: 36px;
            color: #ddd;
            cursor: pointer;
            transition: all 0.2s;
            margin-right: 5px;
        }

        .tech-modal .star-rating input:checked ~ label,
        .tech-modal .star-rating input:hover ~ label,
        .tech-modal .star-rating label:hover,
        .tech-modal .star-rating label:hover ~ label {
            color: #ffc107;
        }

        .tech-modal .rating-feedback {
            display: flex;
            align-items: center;
            margin-left: 20px;
        }

        .tech-modal .rating-feedback span {
            font-weight: 500;
            color: #555;
            margin-right: 10px;
        }

        .tech-modal .rating-emoji {
            font-size: 24px;
        }

        /* Status Options */
        .tech-modal .status-options {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }

        .tech-modal .status-option {
            flex: 1;
        }

        .tech-modal .status-option input {
            display: none;
        }

        .tech-modal .status-option input:checked + .option-card {
            border-color: #4285f4;
            background-color: #f0f7ff;
        }

        .tech-modal .option-card {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 15px 10px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.2s;
        }

        .tech-modal .option-card:hover {
            border-color: #c2c2c2;
        }

        .tech-modal .option-icon {
            font-size: 24px;
            margin-bottom: 8px;
        }

        /* Textarea */
        .tech-modal textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            resize: vertical;
            font-family: inherit;
            font-size: 14px;
            transition: border 0.2s;
        }

        .tech-modal textarea:focus {
            outline: none;
            border-color: #4285f4;
            box-shadow: 0 0 0 2px rgba(66, 133, 244, 0.1);
        }

        .tech-modal .char-counter {
            text-align: right;
            font-size: 12px;
            color: #999;
            margin-top: 5px;
        }

        /* Image Upload */
        .tech-modal .image-upload-container {
            margin-top: 10px;
        }

        .tech-modal .upload-area {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px;
            border: 2px dashed #e0e0e0;
            border-radius: 8px;
            background-color: #fafafa;
            cursor: pointer;
            transition: all 0.2s;
            text-align: center;
            margin-bottom: 15px;
        }

        .tech-modal .upload-area:hover {
            border-color: #c2c2c2;
            background-color: #f5f5f5;
        }

        .tech-modal .upload-area svg {
            margin-bottom: 10px;
            color: #777;
        }

        .tech-modal .preview-images {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .tech-modal .preview-image {
            position: relative;
            width: 80px;
            height: 80px;
            border-radius: 6px;
            overflow: hidden;
        }

        .tech-modal .preview-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .tech-modal .remove-image {
            position: absolute;
            top: 5px;
            right: 5px;
            background: rgba(0, 0, 0, 0.6);
            color: white;
            border: none;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-size: 12px;
        }

        /* Submit Button */
        .tech-modal .submit-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #4285f4, #34a853);
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: 500;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.2s;
            margin-top: 20px;
        }

        .tech-modal .submit-btn:hover {
            opacity: 0.9;
            transform: translateY(-1px);
        }

        .tech-modal .submit-btn svg {
            margin-left: 8px;
        }

        .tech-modal .submit-btn.pulse {
            animation: pulse 1.5s infinite;
        }

        @keyframes pulse {
            0% { box-shadow: 0 0 0 0 rgba(66, 133, 244, 0.4); }
            70% { box-shadow: 0 0 0 10px rgba(66, 133, 244, 0); }
            100% { box-shadow: 0 0 0 0 rgba(66, 133, 244, 0); }
        }
        .close-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            width: 40px;
            height: 40px;
            border: none;
            background: none;
            cursor: pointer;
            padding: 0;
            z-index: 10;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
            border-radius: 50%;
        }

        .close-icon {
            position: relative;
            width: 24px;
            height: 24px;
            transition: transform 0.3s ease;
        }

        .close-svg {
            width: 100%;
            height: 100%;
            transition: all 0.3s ease;
        }

        .close-line {
            transition: all 0.3s ease;
            stroke: #555;
        }

        .close-hover-effect {
            position: absolute;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.05);
            border-radius: 50%;
            opacity: 0;
            transition: all 0.3s ease;
            transform: scale(0.8);
        }

        .close-btn:hover {
            transform: rotate(90deg);
        }

        .close-btn:hover .close-hover-effect {
            opacity: 1;
            transform: scale(1);
        }

        .close-btn:hover .close-line {
            stroke: #ff3b30;
        }

        .close-btn:active {
            transform: rotate(90deg) scale(0.95);
        }

        .close-btn:focus {
            outline: none;
            box-shadow: 0 0 0 3px rgba(66, 133, 244, 0.3);
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 9999;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            justify-content: center;
            align-items: center;
        }

        .modal.active {
            display: flex;
        }
        .rating-btn {
            background: linear-gradient(135deg, #4CAF50, #81C784); /* Xanh lá gradient */
            color: white;
            border: none;
            padding: 10px 18px;
            font-size: 14px;
            border-radius: 30px;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            width: 200px;
        }

        .rating-btn:hover {
            background: linear-gradient(135deg, #388E3C, #66BB6A);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }


        .rating-status {
            font-size: 13px;
            padding: 2px 8px;
            border-radius: 999px;
            width: fit-content;
            margin-bottom: 10px;
        }

        .rated {
            background-color: #e0f7e9;
            color: #2e7d32;
            border: 1px solid #81c784;
        }

        .not-rated {
            background-color: #ffecec;
            color: #d32f2f;
            border: 1px solid #ef9a9a;
        }

        .rating-btn {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 6px 12px;
            font-size: 13px;
            border-radius: 20px;
            cursor: pointer;
            transition: 0.3s;
        }

        .rating-btn:hover {
            background-color: #388E3C;
        }

    </style>
</head>
<body>
<%@include file="header.jsp"%>
<div class="container mt-5">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-3">
            <div class="sidebar p-4">
                <div class="text-center mb-4">
                    <c:set var="item" value="${sessionScope.userInfor}"/>


                    <c:choose>
                        <c:when test="${item.image.startsWith('http')}">
                            <img src="${item.image}" alt="User Avatar" class="user-avatar mb-3">
                        </c:when>
                        <c:otherwise>
                            <img src="img/${item.image}" alt="User Avatar" class="user-avatar mb-3">
                        </c:otherwise>
                    </c:choose>
                    <h5>${item.userName}</h5>
                    <p class="text-muted">Tham gia từ ${item.createDate}</p>
                    <a href="getUser" style="text-decoration: none"><button class="btn btn-primary w-100" >Thông tin</button></a>
                </div>
                <ul class="list-group" style="cursor: pointer" id="menuList">

                    <li class="list-group-item" onclick="checkNone()">Sản phẩm yêu thích</li>
                    <li class="list-group-item active" onclick="checkBlock()">Lịch sử giao dịch</li>
                    <a href="sign_out" style="text-decoration: none"><li class="list-group-item" style="background-color: deepskyblue">Đăng xuất</li></a>
                </ul>
            </div>
        </div>
        <%
            User user = (User) session.getAttribute("userInfor");
            System.out.println(user.toString() + "Thong tin usser");

            Transaction transaction = (Transaction) session.getAttribute("transactions");
            if (transaction != null && transaction.getItems() != null && !transaction.getItems().isEmpty()) {
                for (int i = 0; i < transaction.getItems().size(); i++) {
                    System.out.println(transaction.getItems().get(i).getProducts());
                    System.out.println( "Size cua transaction " + transaction.getItems().size());
                }// Kiểm tra in ra dữ liệu
            } else {
                System.out.println("Transaction hoặc danh sách items trống!");
            }
            WishlistProduct wishlistProduct = (WishlistProduct) session.getAttribute("wishlist");
            if(wishlistProduct == null){
                wishlistProduct = new WishlistProduct();
                session.setAttribute("wishlist",wishlistProduct);
            }
            System.out.println(wishlistProduct.getItems().size() + "wishlist");

        %>
        <!-- Content -->
        <div class="col-md-9" id="ls">
            <h4 class="mb-4">Lịch sử giao dịch</h4>
            <div class="card">
                <div class="card-body">
                    <!-- Filters -->
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <select class="form-select w-auto">

                            <option>Mua hàng</option>

                        </select>
                        <input type="text" class="form-control w-50" placeholder="Tìm theo mã giao dịch">
                    </div>


                    <!-- Transaction Table -->
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>Mã giao dịch</th>
                            <th>Ngày giao dịch</th>
                            <th>Loại giao dịch</th>
                            <th>Số tiền</th>
                            <th>Chi tiết</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${sessionScope.transactions.items}">
                            <tr>
                                <td>${item.idOrder}</td>
                                <td>${item.transactionDate}</td>
                                <td>Thanh toán</td>
                                <td> <fmt:formatNumber value="${item.totalPrice}" type="number" groupingUsed="true" /> đ</td>
                                <td><button class="btn btn-sm btn-primary view-detail" data-id-order="${item.idOrder}">Xem chi tiết</button></td>
                            </tr>
                        </c:forEach>
                        </tbody>

                    </table>
                </div>
            </div>

            <!-- Detail Section -->
            <div class="card detail-section" id="detail-section">
                <div class="card-body">
                    <h5>Chi tiết giao dịch</h5>
                    <ul id="detail-list">
                        <!-- Chi tiết sản phẩm sẽ được thêm vào đây -->
                    </ul>
                    <button class="btn btn-secondary" id="close-detail">Đóng</button>
                </div>
            </div>
        </div>
        <!-- Menu yeu thich -->
        <div class="col-md-9" style="display: none" id="check" >
            <h4 class="mb-4">Sản phẩm yêu thích</h4>
            <div class="card">
                <div class="card-body">
                    <!-- Filters -->
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <select class="form-select w-auto">

                            <option>Sản phẩm yêu thích</option>

                        </select>
                        <input type="text" class="form-control w-50" placeholder="Tìm theo mã sản phẩm">
                    </div>


                    <!-- Transaction Table -->
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>Hình ảnh</th>
                            <th>Tên sản phẩm</th>
                            <th>Mã sản phẩm</th>
                            <th>Ngày thêm</th>
                            <th>Xoá</th>


                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${ not empty sessionScope.wishlist.items}">

                            <c:forEach var="item" items="${sessionScope.wishlist.items}">
                                <tr>
                                    <td><img src="img/${item.img}"></td>
                                    <td>${item.name}</td>
                                    <td>${item.id}</td>
                                    <td>${item.date}</td>
                                    <td style="cursor: pointer"><i class="fa-regular fa-trash-can"></i></td>


                                </tr>
                            </c:forEach>
                        </c:if>


                        </tbody>

                    </table>
                </div>
            </div>
            <!-- Modal Đánh giá sản phẩm -->



            <!-- Detail Section -->
            <div class="card detail-section" id="detail-section1">
                <div class="card-body">
                    <h5>Chi tiết giao dịch</h5>
                    <ul id="detail-list1">
                        <!-- Chi tiết sản phẩm sẽ được thêm vào đây -->
                    </ul>
                    <button class="btn btn-secondary" id="close-detail1">Đóng</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="ratingModal" class="modal tech-modal">
    <div class="modal-overlay" onclick="closeModal()"></div>
    <div class="modal-container">
        <div class="modal-content">
            <button class="close-btn" onclick="closeModal()" aria-label="Đóng cửa sổ đánh giá">
                <div class="close-icon">
                    <svg class="close-svg" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path class="close-line" d="M6 6L18 18" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                        <path class="close-line" d="M18 6L6 18" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                    </svg>
                </div>
                <span class="close-hover-effect"></span>
            </button>

            <div class="modal-header">
                <h2>Đánh Giá Sản Phẩm</h2>
                <p class="subtitle">Chia sẻ trải nghiệm của bạn để giúp chúng tôi cải thiện</p>
                <div class="product-preview">
                    <img id="productReviewImage" src="img/1735388106869_nam-dui-ga-tuoi-loai-1-2-430x430.jpg" alt="Product Image">
                    <div class="product-info">
                        <h4 id="productReviewName">Tên sản phẩm</h4>
                        <div class="product-sku">Mã: <span id="productReviewSku">SKU12345</span></div>
                    </div>
                </div>
            </div>

            <form id="ratingForm" action="${pageContext.request.contextPath}/feedbacks" method="post" enctype="multipart/form-data">
                <input type="hidden" id="productId" name="productId">
                <input type="hidden" id="orderId" name="orderId">
                <input type="hidden" id="stars" name="stars" value="0">

                <div class="rating-section">
                    <label class="section-label">Bạn hài lòng thế nào với sản phẩm này?</label>
                    <div class="star-rating-container">
                        <div class="star-rating">
                            <input type="radio" id="star5" name="rating" value="5">
                            <label for="star5" class="star">★</label>
                            <input type="radio" id="star4" name="rating" value="4">
                            <label for="star4" class="star">★</label>
                            <input type="radio" id="star3" name="rating" value="3">
                            <label for="star3" class="star">★</label>
                            <input type="radio" id="star2" name="rating" value="2">
                            <label for="star2" class="star">★</label>
                            <input type="radio" id="star1" name="rating" value="1">
                            <label for="star1" class="star">★</label>
                        </div>
                        <div class="rating-feedback">
                            <span id="ratingText">Chưa đánh giá</span>
                            <div class="rating-emoji">😊</div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="section-label">Trạng thái sản phẩm</label>
                    <div class="status-options">
                        <label class="status-option">
                            <input type="radio" name="status" value="Mới" required>
                            <div class="option-card">
                                <div class="option-icon">🆕</div>
                                <span>Mới</span>
                            </div>
                        </label>
                        <label class="status-option">
                            <input type="radio" name="status" value="Đã sử dụng">
                            <div class="option-card">
                                <div class="option-icon">⏳</div>
                                <span>Đã sử dụng</span>
                            </div>
                        </label>
                        <label class="status-option">
                            <input type="radio" name="status" value="Bị lỗi">
                            <div class="option-card">
                                <div class="option-icon">⚠️</div>
                                <span>Bị lỗi</span>
                            </div>
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="comment" class="section-label">Nhận xét chi tiết</label>
                    <textarea id="comment" name="comment" rows="4" placeholder="Hãy chia sẻ chi tiết về trải nghiệm của bạn... (Tối thiểu 20 ký tự)" required minlength="20"></textarea>
                    <div class="char-counter"><span id="charCount">0</span>/500</div>
                </div>

                <div class="form-group">
                    <label class="section-label">Hình ảnh đính kèm (Tối đa 3 ảnh)</label>
                    <div class="image-upload-container">
                        <label for="imageUpload" class="upload-area">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h7"></path>
                                <line x1="16" y1="5" x2="22" y2="5"></line>
                                <line x1="19" y1="2" x2="19" y2="8"></line>
                                <circle cx="9" cy="9" r="2"></circle>
                                <path d="M21 15l-3.086-3.086a2 2 0 0 0-2.828 0L6 21"></path>
                            </svg>
                            <span>Thêm ảnh</span>
                            <input type="file" id="imageUpload" name="images" accept="image/*" multiple style="display: none;">
                        </label>
                        <div class="preview-images" id="imagePreview"></div>
                    </div>
                </div>

                <div class="form-actions">
                    <button type="submit" class="submit-btn pulse">
                        <span>Gửi đánh giá</span>
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M22 2L11 13"></path>
                            <path d="M22 2l-7 20-4-9-9-4 20-7z"></path>
                        </svg>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<%-- Kiểm tra nếu có query parameter "success" --%>
<% String success = request.getParameter("success"); %>
<% if ("true".equals(success)) { %>
<div class="notification success">
    <svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
        <polyline points="22 4 12 14.01 9 11.01"></polyline>
    </svg>
    <span>Đánh giá thành công!</span>
</div>
<% } else if ("false".equals(success)) { %>
<div class="notification error">
    <svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <circle cx="12" cy="12" r="10"></circle>
        <line x1="12" y1="8" x2="12" y2="12"></line>
        <line x1="12" y1="16" x2="12.01" y2="16"></line>
    </svg>
    <span>Đã có lỗi xảy ra, vui lòng thử lại.</span>
</div>
<% } %>


<%@include file="footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const detailSection = document.getElementById('detail-section');
        const detailList = document.getElementById('detail-list');
        const closeDetail = document.getElementById('close-detail');

        // Lấy tất cả các giao dịch từ session (chuỗi JSON)
        const transactions = <%= new ObjectMapper().writeValueAsString(transaction.getItems()) %>;

        // Khi nhấn nút "Xem chi tiết"
        document.querySelectorAll('.view-detail').forEach(button => {
            button.addEventListener('click', () => {
                const idOrder = button.getAttribute('data-id-order');
                console.log("ID Order: " + idOrder); // In ra idOrder để kiểm tra

                // Tìm giao dịch tương ứng với idOrder
                const selectedTransaction = transactions.find(t => t.idOrder === parseInt(idOrder));
                console.log("Selected Transaction: ", selectedTransaction); // In ra giao dịch chọn được

                if (selectedTransaction && selectedTransaction.products) {
                    // Kiểm tra từng sản phẩm và in ra console
                    selectedTransaction.products.forEach(product => {
                        console.log(product); // In giá sản phẩm ra console
                    });

                    // Hiển thị danh sách sản phẩm
                    detailList.innerHTML = selectedTransaction.products.map(product => {
                        console.log(product.id); // In id sản phẩm ra console
                        console.log(product.weight)
                        console.log(product.imageURL)
                        console.log(product.id + "danh gia " + product.rated)

                        return '<li class="product-item">' +
                            '<div class="product-details">' +
                            '<span class="product-id"><strong>ID sản phẩm:</strong> ' + product.idProduct + '</span>' +
                            '<span class="product-price"><strong>Giá sản phẩm:</strong> ' + product.price + ' đ</span>' +
                            '<span class="product-name"><strong>Tên sản phẩm:</strong> ' + product.nameProduct + '</span>' +
                            '<span class="product-quantity"><strong>Số lượng:</strong> ' + product.quantity + '</span>' +
                            '<span class="product-weight"><strong>Trọng lượng:</strong> ' + product.weight + 'gr </span>' +
                            '<span class="product-image"><strong>Ảnh:</strong><br><img src="img/' + product.imageURL + '" style="width: 100px;"></span>' +

                            // Trạng thái đánh giá
                            '<div class="rating-status ' + (product.rated ? 'rated' : 'not-rated') + '">' +
                            (product.rated ? '✅ Đã đánh giá' : '❌ Chưa đánh giá') +
                            '</div>' +

                            // Nút Đánh giá
                            '<button class="rating-btn" onclick="openRatingModal(' +
                            product.idProduct + ', \'' +
                            idOrder + '\', \'' +
                            escapeQuotes(product.nameProduct) + '\', \'' +
                            escapeQuotes("img/" + product.imageURL) + '\', \'' +
                            escapeQuotes(product.idProduct || '') + '\'' +
                            ')">' +
                            '📝 Đánh giá' +
                            '</button>' +
                            '</div>' +
                            '</li>';





                    }).join('');  // join() để gộp các phần tử mảng thành một chuỗi

                    detailSection.classList.add('active');
                } else {
                    detailList.innerHTML = '<li>Không có sản phẩm nào.</li>';
                }
            });
        });

        // Đóng chi tiết
        closeDetail.addEventListener('click', () => {
            // Xóa hiệu ứng nhấn khi đóng chi tiết
            document.querySelectorAll('.view-detail').forEach(button => {
                button.classList.remove('clicked');
            });

            // Thêm hiệu ứng đóng phần chi tiết
            detailSection.classList.remove('active');
        });
    });

    // Xử lý rating stars
    document.querySelectorAll('.star-rating input').forEach(star => {
        star.addEventListener('change', function() {
            const rating = this.value;
            document.getElementById('stars').value = rating;

            // Cập nhật text đánh giá
            const ratingTexts = {
                1: "Rất không hài lòng",
                2: "Không hài lòng",
                3: "Bình thường",
                4: "Hài lòng",
                5: "Rất hài lòng"
            };

            const emojis = {
                1: "😠",
                2: "😞",
                3: "😐",
                4: "😊",
                5: "😍"
            };

            document.getElementById('ratingText').textContent = ratingTexts[rating];
            document.querySelector('.rating-emoji').textContent = emojis[rating];
        });
    });

    // Xử lý đếm ký tự textarea
    document.getElementById('comment').addEventListener('input', function() {
        const charCount = this.value.length;
        document.getElementById('charCount').textContent = charCount;

        if (charCount > 500) {
            this.value = this.value.substring(0, 500);
        }
    });

    // Xử lý upload ảnh
    document.getElementById('imageUpload').addEventListener('change', function(e) {
        const previewContainer = document.getElementById('imagePreview');
        previewContainer.innerHTML = '';

        if (this.files.length > 3) {
            alert('Bạn chỉ có thể tải lên tối đa 3 ảnh');
            this.value = '';
            return;
        }

        Array.from(this.files).forEach((file, index) => {
            if (index >= 3) return;

            const reader = new FileReader();
            reader.onload = function(e) {
                const previewDiv = document.createElement('div');
                previewDiv.className = 'preview-image';

                const img = document.createElement('img');
                img.src = e.target.result;

                const removeBtn = document.createElement('button');
                removeBtn.className = 'remove-image';
                removeBtn.innerHTML = '&times;';
                removeBtn.onclick = function() {
                    previewDiv.remove();
                    // Cần thêm logic xóa file khỏi danh sách files nếu cần
                };

                previewDiv.appendChild(img);
                previewDiv.appendChild(removeBtn);
                previewContainer.appendChild(previewDiv);
            };
            reader.readAsDataURL(file);
        });
    });

    function openRatingModal(productId, orderId, productName, productImage, productSku) {
        document.getElementById('productId').value = productId;
        document.getElementById('orderId').value = orderId;
        document.getElementById('productReviewName').textContent = productName;
        document.getElementById('productReviewImage').src = productImage;
        document.getElementById('productReviewSku').textContent = productSku;
        document.body.classList.add('modal-open');

        document.getElementById('ratingModal').classList.add('active');
    }

    function closeModal() {
        document.getElementById('ratingModal').classList.remove('active');
        document.body.classList.remove('modal-open');
    }


    document.addEventListener('DOMContentLoaded', () => {
        // Lấy tất cả các phần tử <li> trong danh sách
        const listItems = document.querySelectorAll('#menuList .list-group-item');

        // Gắn sự kiện click cho từng phần tử
        listItems.forEach(item => {
            item.addEventListener('click', () => {
                // Xóa class active khỏi tất cả các <li>
                listItems.forEach(li => li.classList.remove('active'));

                // Thêm class active vào <li> được nhấp
                item.classList.add('active');
            });
        });
    });
    function escapeQuotes(str) {
        return String(str).replace(/'/g, "\\'").replace(/"/g, '\\"');
    }

</script>

</body>
</html>