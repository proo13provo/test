<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Người Dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-index.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <%@include file="admin-sidebar.jsp"%>

        <!-- Main content -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">Quản Lý Người Dùng</h1>
            </div>

            <!-- Danh sách người dùng -->
            <div class="overview">
                <h2>Danh Sách Người Dùng</h2>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Mã tài khoản</th>
                        <th>Tên</th>
                        <th>Email</th>
                        <th>Ngày sinh</th>
                        <th>Quyền</th>
                        <th>Trạng thái</th>
                        <th>Ngày tạo</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${sessionScope.get_all_user.items}" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td>${user.id}</td>
                            <td>${user.name}</td>
                            <td>${user.email}</td>
                            <td>${user.birtDate}</td>
                            <td> ${user.role}</td>

                            <td>${user.state}</td>
                            <td>${user.createDate}</td>
                            <td>
                                <button class="btn btn-warning btn-sm" data-bs-toggle="modal"
                                        data-bs-target="#editUserModal"
                                        data-id="${user.id}"
                                        data-name="${user.name}"
                                        data-role="${user.role}"
                                        data-state="${user.state}"
                                        onclick="editUser(this)">Chỉnh sửa</button>


                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</div>

<!-- Modal chỉnh sửa thông tin -->
<div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editUserModalLabel">Chỉnh sửa thông tin người dùng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editUserForm" action="../admin/change_info" method="POST">
                    <div class="mb-3">
                        <label for="editUserName" class="form-label">Tên</label>
                        <input type="text" class="form-control" id="editUserName" required name="name">
                    </div>
                    <div class="mb-3">
                        <label for="editUserRole" class="form-label">Role</label>
                        <select class="form-select" id="editUserRole" required name="role">
                            <option value="1">Admin</option>
                            <option value="2">Customer</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="editUserStatus" class="form-label">Trạng thái</label>
                        <select class="form-select" id="editUserStatus" name="state">
                            <option value="1">Đang hoạt động</option>
                            <option value="0">Bị khóa</option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-primary" id="saveEditButton" onclick="saveUserChanges()">Lưu thay đổi
                </button>
            </div>
        </div>
    </div>
</div>


<script src="../js/manage-user.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function saveUserChanges() {
        const form = document.getElementById('editUserForm');
        form.submit(); // Gửi form đến URL được chỉ định trong thuộc tính "action"
    }
    function editUser(button) {
        // Lấy dữ liệu từ các thuộc tính data-* của button
        const id = button.getAttribute('data-id');
        const name = button.getAttribute('data-name');
        const role = button.getAttribute('data-role');
        const state = button.getAttribute('data-state');

        // Điền thông tin vào các trường trong modal
        document.getElementById('editUserName').value = name;
        document.getElementById('editUserRole').value = role;
        document.getElementById('editUserStatus').value = state;

        // Đảm bảo ID người dùng được gửi cùng form
        const form = document.getElementById('editUserForm');
        const inputId = document.createElement('input');
        inputId.type = 'hidden';
        inputId.name = 'idUser';
        inputId.value = id;
        form.appendChild(inputId);
    }
</script>
</body>
</html>