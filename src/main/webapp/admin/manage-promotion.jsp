<%--
  Created by IntelliJ IDEA.
  User: airm2
  Date: 15/12/2024
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quản lý chương trình khuyến mãi</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="../css/admin-index.css">
</head>
<body>
<div class="container-fluid">
  <div class="row">
    <!-- Sidebar -->
    <%@include file="admin-sidebar.jsp"%>

    <!-- Main content -->
    <div class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Quản lý chương trình khuyến mãi</h1>
      </div>

      <div class="overview">
        <h2>Danh sách chương trình khuyến mãi</h2>
        <p>Admin có thể thêm, sửa hoặc xóa các chương trình khuyến mãi tại đây.</p>
        <button class="btn btn-success mb-3" data-bs-toggle="modal" data-bs-target="#addPromotionModal">Thêm chương trình khuyến mãi</button>
        <table class="table table-bordered">
          <thead>
          <tr>
            <th>#</th>
            <th>Tên chương trình</th>
            <th>Mô tả</th>
            <th>Giảm giá (%)</th>
            <th>Ngày bắt đầu</th>
            <th>Ngày kết thúc</th>
            <th>Thao tác</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td>1</td>
            <td>Giảm giá mùa thu</td>
            <td>Giảm giá 10% cho tất cả sản phẩm</td>
            <td>10%</td>
            <td>2024-11-01</td>
            <td>2024-11-30</td>
            <td>
              <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editPromotionModal">Sửa</button>
              <button class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deletePromotionModal">Xóa</button>
            </td>
          </tr>
          <tr>
            <td>2</td>
            <td>Khuyến mãi Black Friday</td>
            <td>Giảm giá 20% cho các sản phẩm chọn lọc</td>
            <td>20%</td>
            <td>2024-11-25</td>
            <td>2024-11-29</td>
            <td>
              <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editPromotionModal">Sửa</button>
              <button class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deletePromotionModal">Xóa</button>
            </td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<!-- Modal thêm chương trình khuyến mãi -->
<div class="modal" id="addPromotionModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Thêm chương trình khuyến mãi</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="mb-3">
            <label for="promotionName" class="form-label">Tên chương trình</label>
            <input type="text" class="form-control" id="promotionName" required>
          </div>
          <div class="mb-3">
            <label for="promotionDescription" class="form-label">Mô tả</label>
            <input type="text" class="form-control" id="promotionDescription" required>
          </div>
          <div class="mb-3">
            <label for="promotionDiscount" class="form-label">Giảm giá (%)</label>
            <input type="number" class="form-control" id="promotionDiscount" required>
          </div>
          <div class="mb-3">
            <label for="startDate" class="form-label">Ngày bắt đầu</label>
            <input type="date" class="form-control" id="startDate" required>
          </div>
          <div class="mb-3">
            <label for="endDate" class="form-label">Ngày kết thúc</label>
            <input type="date" class="form-control" id="endDate" required>
          </div>
          <button type="button" class="btn btn-primary">Thêm</button>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Modal Sửa Chương Trình Khuyến Mãi -->
<div class="modal fade" id="editPromotionModal" tabindex="-1" aria-labelledby="editPromotionModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="editPromotionModalLabel">Sửa chương trình khuyến mãi</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="mb-3">
            <label for="editPromotionName" class="form-label">Tên chương trình</label>
            <input type="text" class="form-control" id="editPromotionName" value="Giảm giá mùa thu">
          </div>
          <div class="mb-3">
            <label for="editPromotionDescription" class="form-label">Mô tả</label>
            <textarea class="form-control" id="editPromotionDescription" rows="3">Giảm giá 10% cho tất cả sản phẩm</textarea>
          </div>
          <div class="mb-3">
            <label for="editPromotionDiscount" class="form-label">Giảm giá (%)</label>
            <input type="number" class="form-control" id="editPromotionDiscount" value="10">
          </div>
          <div class="mb-3">
            <label for="editStartDate" class="form-label">Ngày bắt đầu</label>
            <input type="date" class="form-control" id="editStartDate" value="2024-11-01">
          </div>
          <div class="mb-3">
            <label for="editEndDate" class="form-label">Ngày kết thúc</label>
            <input type="date" class="form-control" id="editEndDate" value="2024-11-30">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
        <button type="button" class="btn btn-primary">Cập nhật chương trình</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal Xóa Chương Trình Khuyến Mãi -->
<div class="modal fade" id="deletePromotionModal" tabindex="-1" aria-labelledby="deletePromotionModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deletePromotionModalLabel">Xóa chương trình khuyến mãi</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Bạn có chắc chắn muốn xóa chương trình khuyến mãi này không? Hành động này sẽ không thể phục hồi.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
        <button type="button" class="btn btn-danger">Xóa</button>
      </div>
    </div>
  </div>
</div>

<script src="../js/manage-promotion.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
