
<%@ page import="Models.cart.Cart" %>

<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Giohang</title>

  <link rel="stylesheet" href="css/styleGiohang.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">



  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


  <link rel="stylesheet" href="css/fontawesome.css">
  <link rel="stylesheet" href="css/templatemo-space-dynamic.css">
  <link rel="stylesheet" href="css/animated.css">
  <link rel="stylesheet" href="css/owl.css">

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

</head>


<body>
<base href="${pageContext.request.contextPath}/">
<%@include file="header.jsp"%>

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
<section class="content" style="border: none">
  <article class="inforkhuyenmai">
    <article class="icon">
      <i class="fa-solid fa-circle-exclamation" style="color: black"></i>
    </article>
    <div class="promo-banner">
      <span>Nhập thông tin khuyến mãi vào đây</span>
    </div>
  </article>
</section>
<!-- Infor san pham va gia tien-->

      <%
        Cart cart = (Cart) session.getAttribute("cr7");
        if (cart == null) {
          cart = new Cart();
          session.setAttribute("cr7", cart);
        }
        System.out.println("Session Cart: " + cart);
        System.out.println("Number of items in cart: " + cart.getItems().size());
      %>



<div class="container my-5">
  <div class="row">

    <!-- Danh sách sản phẩm -->
    <div class="col-lg-8 mb-4">
      <h4 class="mb-3">Giỏ hàng của bạn</h4>
      <table class="table table-borderless table-products">
        <thead>
        <tr>
          <th>Sản phẩm</th>
          <th>ID</th>
          <th>Giá</th>
          <th class="text-center">Số lượng</th>
          <th>Tạm tính</th>
          <th>Xóa</th>
        </tr>

        </thead>
        <tbody>

        <c:forEach var="item" items="${sessionScope.cr7.items}">
        <tr>
          <td>
            <img src="img/${item.img}" alt="Nấm Bào Ngư" class="product-img me-2">
            ${item.name} - ${item.weight}gr
          </td>
          <td >SKU: ${item.id}</td>
          <td>${item.price} đ</td>
          <td class="text-center">
            <div class="quantity-control">
              <a href="checkQuantitySub?productID=${item.id}&weight=${item.weight}&quantity=${item.quantity}" style="text-decoration: none"><button class="btn btn-outline-secondary btn-sm" onclick="decreaseQuantity(this)">-</button></a>
              <input type="text" id="quantity-${item.id}" class="form-control form-control-sm text-center mx-1" value="${item.quantity}" style="width: 50px;" readonly data-price="${item.price}">
              <a href="checkQuantityAdd?productID=${item.id}&weight=${item.weight}&quantity=${item.quantity}" style="text-decoration: none"><button class="btn btn-outline-secondary btn-sm" onclick="increaseQuantity(this)">+</button></a>
            </div>
          </td>



          <td id="subtotal-${item.id}"> <fmt:formatNumber value="${item.total}" type="number" groupingUsed="true" /> đ</td>
          <td><a href="remove?productID=${item.id}&weight=${item.weight}"><button class="btn btn-danger btn-sm">&times;</button></a></td>
        </tr>
        </c:forEach>

        </tbody>
      </table>


      <div class="discount-box">
        <input type="text" class="form-control" placeholder="Nhập mã ưu đãi">
        <button class="btn btn-warning">Áp dụng</button>
      </div>
    </div>


    <div class="col-lg-4">
      <div class="cart-summary">
        <h5>Cộng giỏ hàng</h5>
        <ul class="list-unstyled">
          <c:set var="sum" value="${sessionScope.cr7.totalPrice}" />
          <li><span>Tạm tính:</span> <strong id="cart-total"><fmt:formatNumber value="${sum}" type="number" groupingUsed="true" /> đ</strong></li>


          <li class="total-price"><span>Tổng cộng:</span> <span id="final-total"><fmt:formatNumber value="${sum}" type="number" groupingUsed="true" /> đ</span></li>
        </ul>
        <a href="getShipping" style="text-decoration: none"><button class="btn-checkout w-100 mt-3">Tiến hành thanh toán</button></a>
      </div>
    </div>
  </div>
</div>




<footer class="footer" style="margin-top: 20px">
  <a href="SanPham.jsp" class="img"></a>
</footer>

  <%@include file="footer.jsp"%>

<script src="js/scriptgiohang.js"></script>
<script>
  function increaseQuantity(button) {
    // Lấy id của ô input tương ứng từ nút được nhấn
    const quantityInput = button.parentElement.querySelector('input');
    const subtotalField = document.getElementById(`subtotal-${quantityInput.id.split('-')[1]}`);

    let quantity = parseInt(quantityInput.value);
    quantity += 1; // Tăng số lượng

    // Cập nhật giá trị
    quantityInput.value = quantity;

    // Tính toán lại tạm tính (subtotal) và cập nhật
    const price = parseInt(quantityInput.getAttribute('data-price'));
    subtotalField.innerText = new Intl.NumberFormat().format(quantity * price) + ' đ';
  }

  function decreaseQuantity(button) {
    // Lấy id của ô input tương ứng từ nút được nhấn
    const quantityInput = button.parentElement.querySelector('input');
    const subtotalField = document.getElementById(`subtotal-${quantityInput.id.split('-')[1]}`);

    let quantity = parseInt(quantityInput.value);
    if (quantity > 1) {
      quantity -= 1; // Giảm số lượng

      // Cập nhật giá trị
      quantityInput.value = quantity;

      // Tính toán lại tạm tính (subtotal) và cập nhật
      const price = parseInt(quantityInput.getAttribute('data-price'));
      subtotalField.innerText = new Intl.NumberFormat().format(quantity * price) + ' đ';
    }
  }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>



</html>