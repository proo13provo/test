<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page import="Models.Supplier.Supplier" %>
<%@ page import="Models.Category.Category" %><%--
  Created by IntelliJ IDEA.
  User: airm2
  Date: 15/12/2024
  Time: 21:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-manage-product.css">
</head>
<style>

</style>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <%@include file="admin-sidebar.jsp"%>

        <!-- Main content -->
        <div class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">Quản lý sản phẩm</h1>
            </div>
            <div class="main-content">
                <table class="table table-striped table-bordered">
                    <div class="d-flex justify-content-end">
                        <button class="btn btn-sm btn-success btn-lg" data-bs-toggle="modal" data-bs-target="#addModal">Thêm Sản Phẩm</button>
                    </div>
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên sản phẩm</th>
                        <th>Giá</th>
                        <th>Quy cách</th>
                        <th>Số lượng</th>
                        <th>Ảnh sản phẩm</th>
                        <th>Mô tả</th>
                        <th>Nhà cung cấp</th>
                        <th>Phân loại</th>
                        <th>Trạng thái hoạt động</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${sessionScope.productManages.items}">
                        <tr>
                            <td>${item.id}</td>
                            <td>${item.name}</td>
                            <td><fmt:formatNumber value="${item.price}" type="number" groupingUsed="true" /> đ </td>
                            <td>${item.weight}gr</td>
                            <td>${item.quantity}</td>
                            <td><img src="${pageContext.request.contextPath}/img/${item.image}" alt="Nấm Linh Chi" width="50" style="border-radius: 10px"></td>
                            <td class="short-description">${item.productDescription}</td>
                            <td>${item.supplierName}</td>
                            <td>${item.category}</td>
                            <td>${item.state}</td>
                            <td>
                                <!-- Thêm data-id và data-weight vào nút Sửa -->
                                <button class="btn btn-sm btn-primary edit-btn" data-bs-toggle="modal" data-bs-target="#editModal"
                                        data-id="${item.id}" data-weight="${item.weight}" data-name="${item.name}" data-price="${item.price}"
                                        data-quantity="${item.quantity}" data-description="${item.productDescription}"
                                        data-supplier="${item.supplierName}" data-category="${item.category}">
                                    Sửa
                                </button>

                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


<!-- Modal Thêm sản phẩm-->
<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addModalLabel">Thêm sản phẩm</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="../admin/addProduct" method="POST" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="productName" class="form-label">Tên sản phẩm</label>
                        <input type="text" class="form-control" id="product_Name" name="product_Name">
                    </div>
                    <div class="mb-3">
                        <label for="productPrice" class="form-label">Giá</label>
                        <input type="text" class="form-control" id="product_Price" name="product_Price">
                    </div>
                    <div class="mb-3">
                        <label for="productQuantity" class="form-label">Số lượng</label>
                        <input type="number" class="form-control" id="product_Quantity" name="product_Quantity">
                    </div>
                    <div class="mb-3">
                        <label for="productWeight" class="form-label">Trọng lượng</label>
                        <select class="form-control" id="productWeight" name="product_Weight">
                            <option value="200">200gram</option>
                            <option value="500">500gram</option>
                            <option value="1000">1kg</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="productImages" class="form-label">Ảnh sản phẩm 1</label>
                        <input type="file" class="form-control" id="productImages" name="product_Image1" multiple>
                    </div>
                    <div class="mb-3">
                        <label for="productImages" class="form-label">Ảnh sản phẩm 2</label>
                        <input type="file" class="form-control" id="productImages1" name="product_Image2" multiple>
                    </div>
                    <div class="mb-3">
                        <label for="productImages" class="form-label">Ảnh sản phẩm 3</label>
                        <input type="file" class="form-control" id="productImages2" name="product_Image3" multiple>
                    </div>
                    <div class="mb-3">
                        <label for="productImages" class="form-label">Ảnh sản phẩm 4</label>
                        <input type="file" class="form-control" id="productImages3" name="product_Image4" multiple>
                    </div>
                    <div class="mb-3">
                        <label for="productDescription" class="form-label">Mô tả</label>
                        <textarea class="form-control" id="product_Description" name="product_Description" rows="3"></textarea>
                    </div>
                    <div class="mb-3">
                        <%
                            Supplier item = (Supplier) session.getAttribute("suppliers");
                            if(item == null){
                                item = new Supplier();
                                session.setAttribute("suppliers",item);
                            }
                            Category item1 = (Category) session.getAttribute("categories");
                            if(item1 == null){
                                item1 = new Category();
                                session.setAttribute("categories",item1);
                            }
                            System.out.println(item.getItems().size());
                        %>
                        <label for="productSupplier" class="form-label">Nhà cung cấp</label>
                        <select class="form-control" id="product_Supplier" name="product_Supplier">
                            <c:forEach var="item" items="${sessionScope.suppliers.items}">
                                <option value="${item.id}">${item.name}</option>
                            </c:forEach>
                        </select>

                    </div>
                    <div class="mb-3">
                        <label for="importDate" class="form-label">Ngày thêm sản phẩm</label>
                        <input type="date" class="form-control" id="importDate" name="importDate">
                    </div>
                    <div class="mb-3">
                        <label for="productCategory" class="form-label">Phân loại</label>
                        <select class="form-select" id="product_Category" name="product_Category">
                            <c:forEach var="item" items="${sessionScope.categories.items}">
                                <option value="${item.id}">${item.name}</option>
                            </c:forEach>


                        </select>
                    </div>
                    <div id="promotionSection">
                        <h5>Khuyến mãi</h5>
                        <label for="salePercent" class="form-label">Giảm giá (%)</label>
                        <input type="number" class="form-control" id="salePercent" name="sale_Percent" min="0" max="100" placeholder="Nhập % giảm giá">
                        <label for="saleStartDate" class="form-label">Ngày bắt đầu</label>
                        <input type="date" class="form-control" id="saleStartDate" name="sale_StartDate">
                        <label for="saleEndDate" class="form-label">Ngày kết thúc</label>
                        <input type="date" class="form-control" id="saleEndDate" name="sale_EndDate">
                    </div>
                    <div class="mb-3">
                        <label for="productStatus" class="form-label">Trạng thái hoạt động</label>
                        <select class="form-select" id="product_Status" name="product_Status">
                            <option value="Còn hàng">Còn hàng</option>
                            <option value="Hết hàng">Hết hàng</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Áp dụng</button>
                </form>

            </div>
        </div>
    </div>
</div>

<!-- Modal Sửa -->
<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="${pageContext.request.contextPath}/admin/editProduct" method="POST">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalLabel">Chỉnh sửa sản phẩm</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Thêm trường ẩn để lưu ID -->
                    <input type="hidden" id="productId" name="productId">

                    <div class="mb-3">
                        <label for="productName" class="form-label">Tên sản phẩm</label>
                        <input type="text" class="form-control" id="productName" name="productName">
                    </div>
                    <div class="mb-3">
                        <label for="productPrice" class="form-label">Giá</label>
                        <input type="text" class="form-control" id="productPrice" name="productPrice">
                    </div>
                    <div class="mb-3">
                        <label for="productQuantity" class="form-label">Số lượng</label>
                        <input type="number" class="form-control" id="productQuantity" name="productQuantity">
                    </div>
                    <div class="mb-3">
                        <label for="productWeightChange" class="form-label">Quy cách</label>
                        <select class="form-control" id="productWeightChange" name="productWeight">
                            <option value="200">200gram</option>
                            <option value="500">500gram</option>
                            <option value="1000">1kg</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="productDescription" class="form-label">Mô tả</label>
                        <textarea class="form-control" id="productDescription" name="productDescription" rows="3"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="productSupplier" class="form-label">Nhà cung cấp</label>
                        <select class="form-control" id="productSupplier" name="productSupplier">
                            <c:forEach var="item" items="${sessionScope.suppliers.items}">
                                <option value="${item.id}">${item.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="productCategory" class="form-label">Phân loại</label>
                        <select class="form-select" id="productCategory" name="productCategory">
                            <c:forEach var="item" items="${sessionScope.categories.items}">
                                <option value="${item.id}">${item.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="productStatus" class="form-label">Trạng thái hoạt động</label>
                        <select class="form-select" id="productStatus" name="productStatus">
                            <option value="1">Còn hàng</option>
                            <option value="3">Hết hàng</option>
                            <option value="2">Ngưng bán</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                </div>

            </div>
        </form>
    </div>
</div>


<!-- Modal Xóa -->

<script>
    // Lắng nghe sự kiện click vào nút "Sửa"
    document.querySelectorAll('.edit-btn').forEach(function(button) {
        button.addEventListener('click', function() {
            // Lấy thông tin từ các thuộc tính data-* của nút nhấn
            const id = button.getAttribute('data-id');
            const weight = button.getAttribute('data-weight');
            const name = button.getAttribute('data-name');
            const price = button.getAttribute('data-price');
            const quantity = button.getAttribute('data-quantity');
            const description = button.getAttribute('data-description');
            const supplier = button.getAttribute('data-supplier');
            const category = button.getAttribute('data-category');

            // Điền các giá trị vào form sửa sản phẩm trong modal
            document.getElementById('productId').value = id;  // ID sản phẩm
            document.getElementById('productName').value = name;
            document.getElementById('productPrice').value = price;
            document.getElementById('productQuantity').value = quantity;
            document.getElementById('productWeightChange').value = weight;
            document.getElementById('productDescription').value = description;
            document.getElementById('productSupplier').value = supplier;
            document.getElementById('productCategory').value = category;
        });
    });
    document.querySelectorAll('.delete-btn').forEach(function(button) {
        button.addEventListener('click', function() {
            // Lấy thông tin từ các thuộc tính data-* của nút nhấn
            const id = button.getAttribute('data-id');
            const weight = button.getAttribute('data-weight');

            // Điền các giá trị vào form xóa sản phẩm trong modal
            document.getElementById('productId1').value = id;  // ID sản phẩm
            document.getElementById('productWeight1').value = weight;  // Quy cách sản phẩm
        });
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
