<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav id="sidebar" class="col-md-3 col-lg-2 d-md-block sidebar">
  <div class="position-sticky">
    <h3 class="text-center my-3">Admin Panel</h3>
    <ul class="nav flex-column">
      <li class="nav-item">
        <a class="nav-link ${pageContext.request.requestURI.endsWith('index.jsp') ? 'active' : ''}" href="../index.jsp">Trang chủ</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="../admin/getAllProduct">Quản lý sản phẩm</a>
      </li>

      <li class="nav-item">
        <a class="nav-link ${pageContext.request.requestURI.endsWith('manage-order.jsp') ? 'active' : ''}" href="../admin/getOrderManage">Quản lý đơn hàng</a>
      </li>

      <li class="nav-item">
        <a class="nav-link ${pageContext.request.requestURI.endsWith('manage-user.jsp') ? 'active' : ''}" href="../admin/getAllUser">Quản lý người dùng</a>
      </li>
      <li class="nav-item">
        <a class="nav-link ${pageContext.request.requestURI.endsWith('manage-user.jsp') ? 'active' : ''}" href="categorie.jsp">Thêm Category</a>
      </li>
      <li class="nav-item">
        <a class="nav-link ${pageContext.request.requestURI.endsWith('manage-user.jsp') ? 'active' : ''}" href="dilivery.jsp">Thêm Shipping</a>
      </li>
      <li class="nav-item">
        <a class="nav-link ${pageContext.request.requestURI.endsWith('manage-user.jsp') ? 'active' : ''}" href="addSupplier.jsp">Thêm Supplier</a>
      </li>

    </ul>
  </div>
</nav>

