<%--
  Created by IntelliJ IDEA.
  User: airm2
  Date: 15/12/2024
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quản lý đánh giá sản phẩm</title>
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
        <h1 class="h2">Quản lý đánh giá sản phẩm</h1>
      </div>

      <div class="overview">
        <h2>Danh sách đánh giá</h2>
        <p>Admin có thể xem, phản hồi hoặc xóa các đánh giá không phù hợp.</p>

        <!-- Table for Reviews -->
        <table class="table table-bordered">
          <thead>
          <tr>
            <th>#</th>
            <th>Khách hàng</th>
            <th>Sản phẩm</th>
            <th>Đánh giá</th>
            <th>Ngày đánh giá</th>
            <th>Trạng thái</th>
            <th>Thao tác</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td>1</td>
            <td>Nguyễn Văn A</td>
            <td>Sản phẩm 1</td>
            <td>Rất tốt, sản phẩm chất lượng!</td>
            <td>2024-11-01</td>
            <td><span class="badge bg-warning">Chờ phản hồi</span></td>
            <td>
              <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#respondModal">Phản hồi</button>
              <button class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal">Xóa</button>
            </td>
          </tr>
          <tr>
            <td>2</td>
            <td>Trần Thị B</td>
            <td>Sản phẩm 2</td>
            <td>Sản phẩm không như mong đợi</td>
            <td>2024-11-02</td>
            <td><span class="badge bg-danger">Không phù hợp</span></td>
            <td>
              <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#respondModal">Phản hồi</button>
              <button class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal">Xóa</button>
            </td>
          </tr>
          <!-- Add more reviews as needed -->
          </tbody>
        </table>
      </div>
    </main>
  </div>
</div>

<!-- Modal Phản Hồi Đánh Giá -->
<div class="modal fade" id="respondModal" tabindex="-1" aria-labelledby="respondModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="respondModalLabel">Phản hồi đánh giá</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p><strong>Sản phẩm:</strong> <span id="productName"></span></p>
        <p><strong>Đánh giá:</strong> <span id="reviewText"></span></p>
        <textarea class="form-control" id="responseText" rows="5" placeholder="Nhập phản hồi của bạn tại đây..."></textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
        <button type="button" class="btn btn-primary">Gửi phản hồi</button>
      </div>
    </div>
  </div>
</div>


<!-- Modal Xóa Đánh Giá -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteModalLabel">Xóa Đánh Giá</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Bạn có chắc chắn muốn xóa đánh giá này không? Hành động này sẽ không thể phục hồi.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
        <button type="button" class="btn btn-danger">Xóa</button>
      </div>
    </div>
  </div>
</div>

<script src="../js/manage-review.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
