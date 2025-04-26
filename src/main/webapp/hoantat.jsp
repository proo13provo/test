<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: airm2
  Date: 15/12/2024
  Time: 20:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="css/hoantat.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">



    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="css/fontawesome.css">
    <link rel="stylesheet" href="css/templatemo-space-dynamic.css">
    <link rel="stylesheet" href="css/animated.css">
    <link rel="stylesheet" href="css/owl.css">



</head>
<body>
<%@include file="header.jsp"%>
<%



%>
<!--Noi dung-->
<section class="content">
    <section class="contentform">
        <img src="img/Custom-Icon-Design-Pretty-Office-8-Accept.128.png" alt="">
        <c:set var="order" value="${sessionScope.IDOrder}" />
        <h3><strong>Đặt hàng thành công</strong></h3>
        <p>Bạn đã đặt thành công mã đơn hàng SKU: ${order} </p>
        <p>Sau khi Shop xác nhận đơn hàng, sản phẩm sẽ được giao đến địa chỉ HCM trong dự kiến trước ${sessionScope.expectedDeliveryDay}, ngày ${sessionScope.expectedDeliveryDate}</p>
        <p>Bạn có thể theo dõi đơn hàng tại Thông tin tài khoản > Theo dõi đơn hàng hoặc bấm vào Chi tiết đơn dàng phía dưới.</p>
        <p>Nấm Đỏ rất hân hạnh phục vụ quý khách!</p>
        <section class="sec">
            <article class="conti">
                <a href="products.jsp">Tiếp tục mua sắm</a>
            </article>
            <article class="productdetails">


                <a href="transactionHistory">Chi tiết đơn hàng</a>

            </article>

        </section>

        <!-- Hình ảnh liên kết với bản đồ -->


    </section>

</section>
<section class="section-margin--small section-margin">
    <div class="container">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.1865025331776!2d106.78795677355338!3d10.87341515740026!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3174d89e51ac9d3b%3A0xf5c1ceb1fd6fbf44!2zS2hvYSBDxqEga2jDrSAtIEPDtG5nIG5naOG7hywgVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRQLiBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1703394527772!5m2!1svi!2s" width="1115" height="500" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        <div class="row">
            <div class="col-md-4 col-lg-3 mt-4 mb-4 mb-md-0">
                <div class="media contact-info">
                    <span class="contact-info__icon"><i class="ti-home"></i></span>
                    <div class="media-body">
                        <h3>Trang trại Nấm Xanh</h3>
                        <p>Linh Trung, Thủ Đức
                        </p>
                    </div>
                </div>
                <div class="media contact-info">
                    <span class="contact-info__icon"><i class="ti-headphone"></i></span>
                    <div class="media-body">
                        <h3><a href="tel:454545654">0123 456 789</a></h3>
                        <p>Làm việc từ thứ 2 đến thứ 6</p>
                    </div>
                </div>
                <div class="media contact-info">
                    <span class="contact-info__icon"><i class="ti-email"></i></span>
                    <div class="media-body">
                        <h3><a href="mailto:support@colorlib.com">cocanthietkhong@gmail.com</a></h3>
                        <p>Liên hệ với chúng tôi bất cứ khi nào</p>
                    </div>
                </div>
            </div>
            <div class="col-md-8 col-lg-9">
                <form action="#/" class="form-contact contact_form" action="contact_process.php" method="post" id="contactForm" novalidate="novalidate">
                    <div class="row">
                        <div class="col-lg-5 mt-4">
                            <div class="form-group">
                                <input class="form-control" name="name" id="name" type="text" placeholder="Tên của bạn">
                            </div>
                            <div class="form-group">
                                <input class="form-control" name="email" id="email" type="email" placeholder="Địa chỉ email">
                            </div>
                            <div class="form-group">
                                <input class="form-control" name="subject" id="subject" type="text" placeholder="Số điện thoại">
                            </div>
                        </div>
                        <div class="col-lg-7 mt-4">
                            <div class="form-group">
                                <textarea class="form-control different-control w-100" name="message" id="message" cols="30" rows="5" placeholder="Gửi tin nhắn"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="form-group text-center text-md-right mt-3">
                        <button type="submit" class="button button--active button-contactForm">Gửi</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>


<%@include file="footer.jsp"%>

</body>
</html>