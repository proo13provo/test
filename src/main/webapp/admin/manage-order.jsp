<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: airm2
  Date: 15/12/2024
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý đơn hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/admin-index.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <%@include file="admin-sidebar.jsp"%>

        <!-- Main content -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">Quản lý đơn hàng</h1>
            </div>

            <div class="overview">
                <h2>Danh sách đơn hàng</h2>
                <p>Admin có thể xem chi tiết, cập nhật trạng thái hoặc xóa đơn hàng tại đây.</p>

                <!-- Table for Orders -->
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Mã đơn hàng</th>
                        <th>Mã khách hàng</th>
                        <th>Tên khách hàng</th>
                        <th>Sản phẩm</th>
                        <th>Tổng tiền</th>
                        <th>Trạng thái</th>
                        <th>Ngày đặt</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${sessionScope.order_manage.items}" varStatus="status">
                        <tr>
                            <!-- Số thứ tự tự động tăng -->
                            <td>${status.index + 1}</td>  <!-- Cộng thêm 1 để bắt đầu từ 1 -->
                            <td>#ORD${item.id}</td>
                            <td>ID: ${item.idUser}</td>
                            <td>${item.nameUser}</td>
                            <td>${item.productName}</td>
                            <td><fmt:formatNumber value="${item.totalPrice}" type="number" groupingUsed="true" /> đ</td>
                            <td>${item.state}</td>
                            <td>${item.createDate}</td>
                            <td>
                                <a href="../getOrderDetailManage?idOrder=${item.id}"> <button class="btn btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#viewOrderModal">Xem</button></a>
                                <button class="btn btn-warning btn-sm btn-update-status"
                                        data-order-id="${item.id}"
                                        data-bs-toggle="modal"
                                        data-bs-target="#updateStatusModal">
                                    Cập nhật trạng thái
                                </button>
                            </td>
                        </tr>
                    </c:forEach>


                    <!-- Add more orders as needed -->
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</div>




<!-- Modal Cập Nhật Trạng Thái Đơn Hàng -->
<div class="modal fade" id="updateStatusModal" tabindex="-1" aria-labelledby="updateStatusModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateStatusModalLabel">Cập nhật trạng thái đơn hàng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="../admin/updateOrderStatus" method="POST">
                <!-- Dùng POST để gửi dữ liệu đến server -->
                <div class="modal-body">
                    <input type="hidden" id="orderIdInput" name="idOrder">
                    <div class="mb-3">
                        <label for="orderStatus" class="form-label">Trạng thái đơn hàng</label>
                        <select class="form-select" id="orderStatus" name="status">
                            <option value="1">Đang xử lý</option>
                            <option value="2">Đang giao hàng</option>
                            <option value="3">Hoàn thành</option>
                            <option value="0">Đã hủy</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Cập nhật trạng thái</button>

                </div>
            </form>
        </div>
    </div>
</div>





<script src="../js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="../js/manage-order.js"></script>
<script>
    // Lấy idOrder từ nút và đưa vào modal
    document.querySelectorAll('.btn-update-status').forEach(button => {
        button.addEventListener('click', function() {
            const orderId = this.getAttribute('data-order-id');
            document.getElementById('orderIdInput').value = orderId;
        });
    });
</script>
</body>
</html>
