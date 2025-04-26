<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Models.User.User" %><%--
  Created by IntelliJ IDEA.
  User: airm2
  Date: 07/01/2025
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Thông Tin Cá Nhân</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/guest-info.css">
</head>
<body>
<!-- Header -->
<%@include file="../header.jsp"%>
<%
    HttpSession session1 = request.getSession(true);
    User user = (User) session1.getAttribute("userInfor");
    if(user == null){
        user = new User();
        session1.setAttribute("userInfor",user);
    }

%>
<!-- Content-->
<section class="content">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="profile-card p-4 border rounded-3">
                    <c:set var="item" value="${sessionScope.userInfor}"/>
                    <!-- Thông tin cá nhân và ảnh đại diện -->
                    <div class="profile-container">
                        <div class="container mt-4">
                            <div class="row align-items-center">
                                <!-- Ảnh đại diện -->
                                <div class="col-md-4 text-center">
                                    <c:choose>
                                        <c:when test="${item.image.startsWith('http')}">
                                            <img src="${item.image}" alt="Profile Image" class="profile-image" id="profile-image" style="width: 200px;height: 200px" onclick="changeProfile()">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="../img/${item.image}" alt="Profile Image" class="profile-image" id="profile-image" style="width: 200px;height: 200px" onclick="changeProfile()">
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                                <!-- Thông tin cá nhân -->
                                <div class="col-md-8">
                                    <h5>Thông tin cá nhân</h5>
                                    <h3 id="user-name">${item.userName}</h3> <!-- userName -->
                                    <p id="user-email">${item.email}</p> <!-- email -->
                                    <ul class="list-unstyled">
                                        <li><strong>Địa chỉ:</strong> <span id="user-address">${item.address}</span></li> <!-- address -->
                                        <li><strong>Số điện thoại:</strong> <span id="user-phone">${item.phoneNumber}</span></li> <!-- phoneNumber -->
                                        <li><strong>Ngày sinh:</strong> <span id="user-birthdate">${item.birthDate}</span></li> <!-- birthDate -->
                                        <li><strong>Ngày tham gia:</strong> <span id="user-company">${item.createDate}</span></li>

                                    </ul>
                                    <button class="btn btn-primary me-2" data-bs-toggle="modal" data-bs-target="#editProfileModal" onclick="loadProfileIntoModal()">Chỉnh sửa thông tin</button>
                                    <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#changePasswordModal">Thay đổi mật khẩu</button>

                                </div>
                                <form action="../getOTP" method="GET">
                                    <div class="mb-3">
                                        <label for="otp1" class="form-label">Mã OTP</label>

                                    </div>

                                    <!-- Button gửi mã OTP -->
                                    <button type="submit" class="btn btn-secondary" id="sendOtpBtn">Gửi mã OTP</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <hr>
                </div>


            </div>
        </div>
    </div>

    <!-- Modal Chỉnh sửa thông tin cá nhân -->
    <div class="modal fade" id="editProfileModal" tabindex="-1" aria-labelledby="editProfileModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editProfileModalLabel">Chỉnh sửa thông tin cá nhân</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editProfileForm" action="../ProfileServlet" method="post" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label for="editName" class="form-label">Tên</label>
                            <input type="text" class="form-control" id="editName" name="name" value="">
                        </div>

                        <div class="mb-3">
                            <label for="editPhone" class="form-label">Số điện thoại</label>
                            <input type="text" class="form-control" id="editPhone" name="phone" value="" maxlength="10">
                        </div>

                        <div class="mb-3">
                            <label for="editBirthdate" class="form-label">Ngày sinh</label>
                            <input type="date" class="form-control" id="editBirthdate" name="birthdate" value="">
                        </div>

                        <div class="mb-3">
                            <label for="editAddress" class="form-label">Địa chỉ</label>
                            <input type="text" class="form-control" id="editAddress" name="address" value="">
                        </div>

                        <!-- Thêm trường tải ảnh đại diện -->
                        <div class="mb-3">
                            <label for="editAvatar" class="form-label">Ảnh đại diện</label>
                            <input type="file" class="form-control" id="editAvatar" name="avatar" accept="image/*">
                        </div>

                        <button type="submit" class="btn btn-primary">Gửi</button>
                    </form>
                    <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary" onclick="changeProfile()">Lưu thay đổi</button>
                </div>
                </div>
            </div>

        </div>

    </div>

    <!-- Modal Thay đổi mật khẩu -->
    <div class="modal fade" id="changePasswordModal" tabindex="-1" aria-labelledby="changePasswordModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="changePasswordModalLabel">Thay đổi mật khẩu</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="changePasswordForm" method="POST" action="../changePassword">
                        <!-- Mật khẩu cũ -->
                        <div class="mb-3">
                            <label for="oldPassword" class="form-label">Mật khẩu cũ</label>
                            <input type="password" class="form-control" id="oldPassword" name="oldPassword" required>
                        </div>

                        <!-- Mật khẩu mới -->
                        <div class="mb-3">
                            <label for="newPassword" class="form-label">Mật khẩu mới</label>
                            <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                        </div>

                        <!-- Xác nhận mật khẩu mới -->
                        <div class="mb-3">
                            <label for="confirmPassword" class="form-label">Xác nhận mật khẩu mới</label>
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                        </div>

                        <!-- Trường OTP -->
                        <div class="mb-3">
                            <label for="otp1" class="form-label">Mã OTP</label>
                            <input type="text" class="form-control" id="otp1" name="otp" required style="width: 20%">
                        </div>


                        <!-- Button lưu thay đổi -->
                        <button type="submit" class="btn btn-primary" id="saveChangesBtn">Lưu thay đổi</button>
                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Script-->
<script src="/js/guest-info.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
