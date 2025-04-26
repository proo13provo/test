<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: airm2
  Date: 16/01/2025
  Time: 01:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Hóa đơn chi tiết</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
      font-family: 'Roboto', sans-serif;
    }
    .invoice-container {
      max-width: 850px;
      margin: 50px auto;
      border-radius: 20px;
      padding: 30px;
      background: #ffffff;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
    }
    .invoice-header {
      background: linear-gradient(135deg, #ff7e5f, #feb47b);
      color: #ffffff;
      padding: 20px;
      border-radius: 20px 20px 0 0;
      text-align: center;
    }
    .invoice-header h1 {
      font-size: 2.5rem;
      font-weight: bold;
    }
    .invoice-header p {
      margin: 5px 0 0;
      font-size: 1rem;
    }
    .invoice-body {
      padding: 25px;
      color: #333333;
    }
    .invoice-body table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 20px;
    }
    .invoice-body table th {
      text-align: left;
      font-weight: bold;
      background: #f7f7f7;
      border-bottom: 2px solid #ddd;
      padding: 10px;
    }
    .invoice-body table td {
      padding: 10px;
      border-bottom: 1px solid #ddd;
    }
    .invoice-footer {
      background: #f7f7f7;
      padding: 20px;
      border-radius: 0 0 20px 20px;
      text-align: center;
    }
    .btn-print {
      background: linear-gradient(135deg, #36d1dc, #5b86e5);
      color: white;
      font-weight: bold;
      padding: 10px 25px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: all 0.3s ease;
    }
    .btn-print:hover {
      background: linear-gradient(135deg, #5b86e5, #36d1dc);
      transform: scale(1.05);
    }
    .btn-close {
      background: linear-gradient(135deg, #ff7e5f, #feb47b);
      color: white;
      font-weight: bold;
      padding: 10px 25px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: all 0.3s ease;
      width: 10%;
      height: 10%;
    }
    .btn-close:hover {
      background: linear-gradient(135deg, #feb47b, #ff7e5f);
      transform: scale(1.05);
    }
  </style>
</head>
<body>
<div class="invoice-container">
  <div class="invoice-header">
    <h1>Đơn hàng</h1>
    <p>Chi tiết đơn hàng</p>
  </div>
  <div class="invoice-body">
    <table>
      <c:forEach var="item" items="${sessionScope.order_detail_manage.items}">
        <tr>
          <th>Thông tin</th>
          <th>Chi tiết</th>
        </tr>
        <tr>

          <td><strong>Khách hàng</strong></td>
          <td>${item.nameUser}</td>
        </tr>
        <tr>
          <td><strong>Sản phẩm</strong></td>
          <td>
            <ul style="padding-left: 15px;">
              <li>${item.productName}</li>

            </ul>
          </td>
        </tr>
        <tr>
          <td><strong>Tổng tiền</strong></td>
          <td><fmt:formatNumber value="${item.totalPrice}" type="number" groupingUsed="true" /> đ</td>
        </tr>
        <tr>
          <td><strong>Trạng thái</strong></td>
          <td>${item.state}</td>
        </tr>
        <tr>
          <td><strong>Ngày đặt</strong></td>
          <td>${item.createDate}</td>
        </tr>
        <tr>
          <td><strong>Thông tin giao hàng</strong></td>
          <td>${item.receiveAddress}</td>
        </tr>
      </c:forEach>

    </table>
  </div>
  <div class="invoice-footer">
    <button class="btn-print" onclick="window.print()">In đơn hàng</button>
    <button class="btn-close" onclick="window.location.href='manage-order.jsp'">Đóng</button>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
