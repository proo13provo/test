<%@ page import="Models.Category.Category" %><%--
  Created by IntelliJ IDEA.
  User: airm2
  Date: 15/12/2024
  Time: 22:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giohang</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">



    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="css/fontawesome.css">
    <link rel="stylesheet" href="css/templatemo-space-dynamic.css">
    <link rel="stylesheet" href="css/animated.css">
    <link rel="stylesheet" href="css/owl.css">
    <style>
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

    </style>
</head>
<body>
<section class="header">

    <div>
        <div class="" style="background-color: antiquewhite">
            <div class="row">
                <div class="col-3 p-2 text-black">
                    <div class="d-flex justify-content-center">
                        <img src="${pageContext.request.contextPath}/img/logo.png" style="height: 50px" alt="Logo">
                    </div>
                </div>
                <div class="col-6 p-3 text-black">
                    <div class="d-flex justify-content-center">
                        <ul class="nav">
                            <!-- Menu luôn hiển thị -->
                            <li class="nav-item">
                                <a class="nav-link fw-bold text-dark" href="${pageContext.request.contextPath}/index.jsp">HOME</a>
                            </li>
                            <li class="nav-item">
                                <button type="button" class="btn dropdown-toggle fw-bold" data-bs-toggle="dropdown">SẢN PHẨM</button>
                                <ul class="dropdown-menu">
                                    <c:if test="${not empty sessionScope.categories}">
                                        <c:forEach var="item" items="${sessionScope.categories.items}">
                                            <li>
                                                <a class="dropdown-item" href="${pageContext.request.contextPath}/product_category?idCategory=${item.id}">
                                                        ${item.name}
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </c:if>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <button type="button" class="btn dropdown-toggle fw-bold" data-bs-toggle="dropdown">CHIA SẺ</button>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link fw-bold text-dark" href="#">HỢP TÁC</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link fw-bold text-dark" href="">CÔNG TY</a>
                            </li>

                            <!-- Menu dành cho admin -->
                            <c:if test="${sessionScope.idRole == '1'}">
                                <li class="nav-item">
                                    <a class="nav-link fw-bold text-dark" href="${pageContext.request.contextPath}/admin/getAllProduct">
                                        ADMIN
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
                <div class="col-3 p-3 text-black">
                    <div class="d-flex justify-content-center">
                        <ul class="nav">
                            <li class="nav-item">
                                <button type="button" class="btn btn-warning" id="user-name-btn">
                                   <%= session.getAttribute("nameRole") != null ? session.getAttribute("nameRole") : "Guest" %>
                                </button>
                            </li>

                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/transactionHistory">
                                    <button type="button" class="btn">
                                        <i class="fa-solid fa-user"></i>
                                    </button>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/shoppingCart.jsp">
                                    <button type="button" class="btn cart-icon">
                                        <i class="fa-solid fa-cart-shopping"></i>
                                        <span class="cart-badge" id="cart-badge" style="margin: 0">3</span>
                                    </button>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
