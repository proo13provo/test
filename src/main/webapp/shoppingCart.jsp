<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page import="Models.cart.Cart" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Giohang</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="css/shoppingcart.css">
<script src="https://kit.fontawesome.com/your-fontawesome-kit.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<base href="${pageContext.request.contextPath}/">


<%@include file="header.jsp"%>
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


<div class="glow-divider"></div>
    <header class="progress-header" data-aos="fade-up" >
        <div class="step-container">
          <div class="step active" data-aos="zoom-in">
            <div class="step-icon">1</div>
            <div class="step-text">GIỎ HÀNG</div>
          </div>
          <div class="step-line" data-aos="fade-right"></div>
          <div class="step" data-aos="zoom-in">
            <div class="step-icon">2</div>
            <div class="step-text">THANH TOÁN</div>
          </div>
          <div class="step-line" data-aos="fade-right"></div>
          <div class="step" data-aos="zoom-in">
            <div class="step-icon">3</div>
            <div class="step-text">HOÀN TẤT</div>
          </div>
        </div> 
       
    </header>
     
   <section class="cart-animation-container">
        <i class="fa-solid fa-shop"></i>
        <i class="fa-solid fa-truck-moving cart-icon1"></i>
        <i class="fa-solid fa-shop" style="float: right;font-size: 20px;"></i>
    </section>
   

    
    

    <div class="container my-5">
        <div class="row">
            <!-- Danh sách sản phẩm -->
            <div class="col-lg-8">
                <h4 class="cart-title">
                    <i class="fa-solid fa-cart-plus"></i> Giỏ hàng của bạn
                </h4>
                
                <div class="cart-container">
                    <c:forEach var="item" items="${sessionScope.cr7.items}">
                        <div class="cart-item">
                            <img src="img/${item.img}" alt="Sản phẩm">
                            <div class="cart-info">
                                <h5>${item.name}</h5>
                                <p><span style="color: rgb(83, 7, 7);">ID:</span> ${item.id} | <span style="color: rgb(83, 7, 7);">Trọng lượng:</span>${item.weight}gr</p>

                                <!-- Hiển thị giá -->
                                <div class="price-container" style="color: rgb(240, 89, 89); ;"><b>Giá:</b>
                                    <span class="original-price">${item.price} đ</span>
                                    <span class="discount-badge">-${item.sale}%</span>
                                    <span class="discount-price"><fmt:formatNumber value="${item.total}" type="number" groupingUsed="true" /> đ</span>
                                </div>
                            </div>

                            <!-- Input số lượng -->
                            <td class="text-center">
                                <div class="quantity-control">
                                    <a href="checkQuantitySub?productID=${item.id}&weight=${item.weight}&quantity=${item.quantity}" style="text-decoration: none"><button class="btn btn-outline-secondary btn-sm" onclick="decreaseQuantity(this)">-</button></a>
                                    <input type="text" id="quantity-${item.id}" class="form-control form-control-sm text-center mx-1" value="${item.quantity}" style="width: 50px;" readonly data-price="${item.price}">
                                    <a href="checkQuantityAdd?productID=${item.id}&weight=${item.weight}&quantity=${item.quantity}" style="text-decoration: none"><button class="btn btn-outline-secondary btn-sm" onclick="increaseQuantity(this)">+</button></a>
                                </div>
                            </td>

                            <!-- Nút xóa -->
                            <td><a href="remove?productID=${item.id}&weight=${item.weight}"><button class="remove-btn ms-3"><i class="fas fa-trash-alt"></i></button></a></td>
                        </div>
                    </c:forEach>


                    
    


                </div>
    
                <!-- Mã giảm giá -->
                <div class="mt-3">
                    <input type="text" class="form-control d-inline-block w-75" placeholder="🎟 Nhập mã ưu đãi">
                    <button class="btn btn-warning ms-2">Áp dụng</button>
                </div>
            </div>
    
            <!-- Tổng kết giỏ hàng -->
            <div class="col-lg-4">
                <div class="cart-summary">
                    <h5 class="mb-3 box">📦 Cộng giỏ hàng</h5>
                    <c:set var="discountPrice" value="${sessionScope.cr7.totalPrice}" />
                    <c:set var="totalPrice" value="${sessionScope.cr7.rawTotalPrice}" />
                    <c:set var="saveMoney" value="${sessionScope.cr7.saveMoney}" />
                    <ul class="list-unstyled">
                        <li class="d-flex justify-content-between">
                            <span>Tạm tính:</span> 
                            <strong id="cart-total"><fmt:formatNumber value="${totalPrice}" type="number" groupingUsed="true" /> đ</strong>
                        </li>
                        <li class="d-flex justify-content-between mt-2">
                            <span class="fw-bold text-warning">Tiết kiệm:</span>
                            <span id="discount-amount" class="text-danger"> -<fmt:formatNumber value="${saveMoney}" type="number" groupingUsed="true" /> đ</span>
                        </li>
                        
                        <li class="total-price d-flex justify-content-between mt-2">
                            <span class="fw-bold">Tổng cộng:</span>
                            <span id="final-total" class="text-danger fw-bold"><fmt:formatNumber value="${discountPrice}" type="number" groupingUsed="true" /> đ</span>
                        </li>
                    </ul>
                    <a href="getShipping" style="text-decoration: none">   <button class="checkout-btn">
                        <i class="fas fa-credit-card"></i> Tiến hành thanh toán
                    </button></a>
                </div>
            </div>
        </div>
    </div>



<footer class="footer" style="margin-top: 20px">
    <a href="SanPham.jsp" class="img"></a>
</footer>

<%@include file="footer.jsp"%>

    
    <div class="social-icons" style="display: flex;flex-direction: column; gap: 10px;">
        <a href="https://www.facebook.com/hoang.vu.241077" style="display: flex; align-items: center; justify-content: center; width: 40px; height: 40px; background-color: #1877F2; color: white; border-radius: 50%;">
            <img src="image/2023_Facebook_icon.svg.png" alt="FB" style="width: 50px; height: 50px;">
        </a>
        <a href="#" style="display: flex; align-items: center; justify-content: center; width: 40px; height: 40px; background-color: #C13584; color: white; border-radius: 50%;">
            <img src="image/Unknown1.png" alt="FB" style="width: 50px; height: 50px;">
        </a>
        <a href="#" style="display: flex; align-items: center; justify-content: center; width: 40px; height: 40px; color: white; border-radius: 50%;">
            <img src="image/174855.png" alt="FB" style="width: 50px; height: 50px;"></a>
        <a href="#" style="display: flex; align-items: center; justify-content: center; width: 40px; height: 40px; background-color: #000000; color: white; border-radius: 50%;">
            <img src="image/187197.png" alt="FB" style="width: 50px; height: 50px;"></a>
        
    </div>

  <script src="js/header.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
  <script>
    AOS.init({ duration: 1000 });
  </script>
  <script src="js/shoppingCart.js"></script>
</body>
</html>
