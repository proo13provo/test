<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Trang Chủ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/css/admin-index.css' />">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <%@include file="admin-sidebar.jsp"%>

        <!-- Main content -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">Chào mừng, Admin</h1>
            </div>

            <!-- Thẻ thông báo -->
            <div class="row mb-4">
                <div class="col-md-4">
                    <div class="card text-white bg-primary mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Tổng số sản phẩm</h5>
                            <p class="card-text display-5">${totalProducts}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-white bg-success mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Đơn hàng hôm nay</h5>
                            <p class="card-text display-5">${todayOrders}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-white bg-warning mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Phản hồi mới</h5>
                            <p class="card-text display-5">${newFeedbacks}</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Biểu đồ doanh thu -->
            <div class="row">
                <div class="col-md-8">
                    <canvas id="salesChart"></canvas>
                </div>
                <div class="col-md-4">
                    <h5>Công việc cần làm</h5>
                    <ul class="list-group">
                        <c:forEach var="task" items="${tasks}">
                            <li class="list-group-item">${task}</li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </main>
    </div>
</div>

<script src="<c:url value='/js/admin-index.js' />"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
</body>
</html>
