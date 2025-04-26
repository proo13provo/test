<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Category</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .form-container {
            max-width: 500px;
            margin: 50px auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .btn-custom {
            background: linear-gradient(90deg, #ff7e5f, #feb47b);
            border: none;
            color: #fff;
        }
        .btn-custom:hover {
            background: linear-gradient(90deg, #feb47b, #ff7e5f);
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Add New Category</h2>

    <!-- Hiển thị thông báo thành công hoặc lỗi -->
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success">${successMessage}</div>
    </c:if>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/admin/addCategories" method="POST">
        <div class="mb-3">
            <label for="categoryName" class="form-label">Category Name</label>
            <input type="text" class="form-control" id="categoryName" placeholder="Enter category name" required name="categoryName">
        </div>
        <div class="mb-3">
            <label for="categoryDescription" class="form-label">Description</label>
            <textarea class="form-control" id="categoryDescription" rows="4" placeholder="Enter category description" required name="categoryDescription"></textarea>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-custom w-100">Add Category</button>
        </div>
    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>