<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Supplier</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .form-container {
      max-width: 600px;
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
      background: linear-gradient(90deg, #36d1dc, #5b86e5);
      border: none;
      color: #fff;
    }
    .btn-custom:hover {
      background: linear-gradient(90deg, #5b86e5, #36d1dc);
    }
    .alert {
      margin-top: 20px;
    }
  </style>
</head>
<body>
<div class="form-container">
  <h2>Add New Supplier</h2>

  <!-- Hiển thị thông báo nếu có -->
  <c:if test="${not empty message}">
    <div class="alert alert-success">
        ${message}
    </div>
  </c:if>

  <form action="../admin/addSupplier" method="POST">
    <div class="mb-3">
      <label for="supplierName" class="form-label">Supplier Name</label>
      <input type="text" class="form-control" id="supplierName" placeholder="Enter supplier name" required name="supplierName">
    </div>
    <div class="mb-3">
      <label for="contactInfo" class="form-label">Contact Info</label>
      <input type="text" class="form-control" id="contactInfo" placeholder="Enter contact information" required name="contactInfo">
    </div>
    <div class="mb-3">
      <label for="address" class="form-label">Address</label>
      <textarea class="form-control" id="address" rows="3" placeholder="Enter address" required name="address"></textarea>
    </div>
    <div class="mb-3">
      <label for="isActive" class="form-label">Is Active</label>
      <select class="form-select" id="isActive" required name="isActive">
        <option value="1">Yes</option>
        <option value="0">No</option>
      </select>
    </div>
    <div class="text-center">
      <button type="submit" class="btn btn-custom w-100">Add Supplier</button>
    </div>
  </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>