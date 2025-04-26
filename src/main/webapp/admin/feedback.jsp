<%--
  Created by IntelliJ IDEA.
  User: airm2
  Date: 15/12/2024
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Phản Hồi Khách Hàng</title>
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
                <h1 class="h2">Phản Hồi Khách Hàng</h1>
            </div>

            <!-- Danh sách tin nhắn từ khách hàng -->
            <div class="overview">
                <h2>Danh Sách Tin Nhắn</h2>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Tên khách hàng</th>
                        <th>Email</th>
                        <th>Tin nhắn</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- Mẫu dữ liệu tin nhắn -->
                    <tr>
                        <td>1</td>
                        <td>Nguyễn Văn A</td>
                        <td>a@example.com</td>
                        <td>Chào cửa hàng, tôi muốn biết thêm về sản phẩm Lingzhi.</td>
                        <td>
                            <button class="btn btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#responseModal"
                                    onclick="loadResponse('Nguyễn Văn A', 'a@example.com', 'Chào cửa hàng, tôi muốn biết thêm về sản phẩm Lingzhi.')">
                                Phản hồi
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Trần Thị B</td>
                        <td>b@example.com</td>
                        <td>Sản phẩm Cordyceps của bạn có giá bao nhiêu?</td>
                        <td>
                            <button class="btn btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#responseModal"
                                    onclick="loadResponse('Trần Thị B', 'b@example.com', 'Sản phẩm Cordyceps của bạn có giá bao nhiêu?')">
                                Phản hồi
                            </button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <!-- Modal phản hồi -->
            <div class="modal fade" id="responseModal" tabindex="-1" aria-labelledby="responseModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="responseModalLabel">Phản hồi khách hàng</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="responseMessage" class="form-label">Tin nhắn phản hồi</label>
                                <textarea class="form-control" id="responseMessage" rows="4"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                            <button type="button" class="btn btn-primary" onclick="sendResponse()">Gửi phản hồi</button>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<script src="js/feedback.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
